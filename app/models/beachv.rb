#URLにアクセスする
require 'open-uri'
#http->httpsのRedirectionを追う
require 'open_uri_redirections'
#nokogiriでparseする
require 'nokogiri'

# スクレイピング先のURL
url = 'http://neet-project.com/cgi-bin/schedule/index.cgi'

# 連続アクセスを防ぐために時間を置く
sleep(1)

charset = nil

#URL先を開く
html = open(url, :allow_redirections => :safe) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

#ライブの詳細を取得
details = doc.css('.TD_base')
details.each do |detail|
	p detail.inner_text
end