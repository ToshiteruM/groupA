2014 enPit bizApp groupA
========================
[![Build Status](https://travis-ci.org/ToshiteruM/groupA.svg?branch=master)](https://travis-ci.org/ToshiteruM/groupA)

Purpose
-------------
ショッピングサイトが違っても最も価格の安い商品が探せるようにします。

現状、楽天とYahooショッピングの二つのサイトの価格情報を比較できる使用です。

Functions
-------------
キーワード検索で楽天とYahooショッピングの掲載商品を安い順に表示します。

現在は両方のサイトの検索結果Top10が出力されます。

Components
-----------------
フレームワークにはSinatraを使っています。主要な構成ファイルは以下の通りです。
*groupA.rb : mainのRubyスクリプト
*views
    *input.erb : 検索キーワード入力ページのhtmlテンプレート
    *result.erb : 結果表示ページのhtmlテンプレート

Issues
-------------
*結果の不正確性・・・現状では、入力したキーワードの検索結果をそのまま並べているため、あまり結果が正確ではありません。意図したものではない商品が表示される場合があります。

Contributor
-------------

- 三根 敏照
- 二宮 啓彰
- 大橋 佑亮
- 江口 佳記
- 金田 博
