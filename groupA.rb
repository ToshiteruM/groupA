# -*- coding: utf-8 -*-
require 'sinatra'
require 'rakuten_web_service'
require 'net/http'
require 'json'

#参考: https://github.com/k2works/sinatra_rakuten_api

get '/' do
  erb :input
end

get '/result' do
  #設定
  ##楽天API
  RakutenWebService.configuration do |c|
    c.application_id = ENV["APPID"]
    c.affiliate_id = ENV["AFID"]
  end

  @keyword = params[:input]['keyword']
  @disp_num = 10 #表示データ数
  @items = RakutenWebService::Ichiba::Item.search(:keyword =>@keyword, :sort => "+itemPrice", :hits=>@disp_num)
  @yahoo_items = getYahooReq(@keyword, @dispnum)
  erb :result
end

def getYahooReq(keyword,dispnum)
  keyword = keyword.encode("utf-8")
  yahoo_id = ENV["YAHOO_APPID"]
  host = "shopping.yahooapis.jp"
  api_path = "/ShoppingWebService/V1/json/itemSearch"
  http  = Net::HTTP.new(host,80)
  query = "?appid=#{yahoo_id}&query=#{keyword}&sort=%2Bprice&hits=#{dispnum}"
  puts query #debug
  req   = Net::HTTP::Get.new(api_path + query)
  res   = http.request(req)
  #p res.body #debug
  json_info = JSON.parse(res.body)
  yahoo_items = Array.new
  json_info["ResultSet"]["0"]["Result"].each do |key, value|
    if key =~ /[0-9]+/
      yahoo_items.push({:name=>value["Name"], :price=>value["Price"]["_value"]})
    end
  end
  return yahoo_items
end
