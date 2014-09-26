# -*- coding: utf-8 -*-
require 'sinatra'
require 'rakuten_web_service'

#参考: https://github.com/k2works/sinatra_rakuten_api

get '/' do
  erb :input
end

get '/result' do
  RakutenWebService.configuration do |c|
    c.application_id = ENV["APPID"]
    c.affiliate_id = ENV["AFID"]
  end

  @keyword = params[:input]['keyword']
  @disp_num = 10 #表示データ数
  @items = RakutenWebService::Ichiba::Item.search(:keyword =>@keyword, :sort => "+itemPrice")
  erb :result
end
