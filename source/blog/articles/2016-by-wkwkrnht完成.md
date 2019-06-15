---
title: 2016-by-wkwkrnht完成
date: 2016-09-24T01:39:46+09:00
author: wkwkrnht
description: 2016-by-wkwkrnht初版公開時の記事。初々しさをお楽しみください。今はもうリファクタリング済みですけれども、当時はこのようなことをしていました。詳しくはGithubで。
image: /wp-content/uploads/2017/03/2016-by-wkwkrnht.png
tags:
  - Google
  - wordpress
  - お知らせ
  - サイト運営
  - ブログ
---
[先日の記事の通り](http://wkwkrnht.wp.xdomain.jp/delusion/472)、そちらに集中したいため、ここいらで切り上げたいと思います。おそらくは、コメントやreadme更新が気が向いたら入るくらいかと思います。国際化は難儀だったもので。以下が、更新内容です。

  * テーブルがクイックタグでマークアップできるように
  * 画像なしの関連記事ウィジェット導入(まだデザインの調整が……)
  * OGPBlogcardのデザイン調整
  * 記事内のaタグホバー時にリンクURLが表示されるように
  * ソーシャルメニュー内で色がつくリンクが増加
  * フロートメニュー内に閉じるボタンが表示されるように
  * カスタマイザーで色調整ができるように？(動作確認が取れない……)
  * 検索ウィジェットをきちんとした形に
  * タグ指定とカテゴリー指定が可能に
  * デザインの調整完了

  * 構造化マークアップ強化
  * hentryとhatomのバグが出ないように
  * NewsArticleなjsonを記事ページに出力するように
  * WPHeader
  * WPAdblock
  * SiteNavigationElements
  * SearchResulghts

  * メニュー表示用のスクリプトはonClickでネイティブに
  * jQueryはWordpress内蔵のものに変更(＝ダウングレード)
  * .cssファイルをひとまとめに
  * baguetteBox関連のファイルをひとまとめに
  * devices.css導入
  * 各.cssファイル向けコピーライト移設
  * disqusウィジェットのコードもテンプレート化
  * composer.json導入
  * devices.css削除
  * メニューボタンと共有メニューボタンとホームボタンのトグルを新設
  * ホーム以外で、ホームボタンが表示できるように
  * エディタースタイル適用開始
  * 固定ページにカテゴリーとタグが設定できるように
  * OGPBlogcardにシェア機能追加
  * リストページ上下とリスト内上下と404ページと投稿ページ上にウィジェットエリア新設
  * リストページ内のカードではみ出していたものがスクロール可能に
  * 404.php削除
  * ソーシャルメニューでリンクテキストがdata-title属性内に表示されるように
  * 「問い合わせ」や「Q&A」というリンクテキストがソーシャルメニュー内にあるとはてなマークで表示されるように
  * 代わりにgoo.gl/formの装飾が削除
  * target="_blank"なaタグにrel="noopener"をつけるように
  * ウィジェット内でショートコードが使用可能に
  * アフィ周りのプロフィール情報削除
  * Chromeのアドレスバーカラーを直感的に選べるように
  * devices.css削除
  * メニューボタンと共有メニューボタンとホームボタンのトグルを新設
  * ホーム以外で、ホームボタンが表示できるように
  * エディタースタイル適用開始
  * 固定ページにカテゴリーとタグが設定できるように
  * OGPBlogcardにシェア機能追加
  * リストページ上下とリスト内上下と404ページと投稿ページ上にウィジェットエリア新設
  * リストページ内のカードではみ出していたものがスクロール可能に
  * 404.php削除
  * ソーシャルメニューでリンクテキストがdata-title属性内に表示されるように
  * 「問い合わせ」や「Q&A」というリンクテキストがソーシャルメニュー内にあるとはてなマークで表示されるように
  * 代わりにgoo.gl/formの装飾が削除
  * target=&#8221;_blank&#8221;なaタグにrel=&#8221;noopener&#8221;をつけるように
  * ウィジェット内でショートコードが使用可能に
  * アフィ周りのプロフィール情報削除
  * Chromeのアドレスバーカラーを直感的に選べるように
  * ナイトモード実装
  * ウィジェットがカスタマイザーに対応
  * Googleサイト内検索ウィジェットの実装
  * チャットフォーマット時に起きていた、前後記事ナビの重なりが解消
  * トップのリストページ以外に、パンくずリストのJSONマークアップが出力されるように
  * それに伴って、パンくずリストが削除
  * トップページには、WebpageなマークアップをJSONで出力
  * Pinterestの認証が可能に(未検証)
  * Google Adsense周りも充実(ウィジェットやらショートコードやらいろいろ追加)
  * ウィジェット設定の消滅と今までの設定をウィジェットごとに行うように変更
  * カスタムヘッダー機能に対応
  * 見出し周りのCSS修正
  * 色選択可能範囲拡大
  * 純正ショートコードとspotify埋め込のクイックタグも増設
  * amp.phpの仕様変更
  * role=&#8221;searc﻿h﻿&#8221;追加
  * tabindex=&#8221;0&#8243;追加
  * role=&#8221;button&#8221;追加
  * TinyMCEにボタン追加
  * CSSのブレイクポイントが992pxと640pxの2つに変わりました
  * 自動生成される画像を増やしました(レスポンシブイメージ対応のためです)
  * singular.phpとindex.phpを結合しました
  * special-card.phpもindex.phpに結合しました
  * special-cardの一般形でサイトの概要を表示しないように
  * カスタマイザーを読み込めなかった不具合を解消
  * メインメニューと共有メニューへの動線の変化
  * 始めの「＋」ボタンでメニューウィンドウが出るように
  * メニューウィンドウ内のタブでメインメニューと共有メニューの切り替えを行うように

  * Instapaperとvkとstumbleuponとbufferへの共有に対応
  * olタグに装飾追加
  * [ホバーで出てくる前後ナビゲーションウィジェットの追加](https://q-az.net/wordpress-nyoki-nav/)
  * ナイトモードのバグ修正
  * Live Dwango Readerのソーシャルメニュー内装飾対応
  * target=&#8221;_blank&#8221;とtitle属性を自動付与するショートコード[link]を追加

それでは、きちんとネイティブPHPの沼に浸かってきます。何かありましたら、コメントなりメンションなり飛ばしてください。下記が、自慢のウィジェットエリア。

## 目次機能を付けました

データベース系の記事が増えてきたので、目次がほしいなぁと思っていたところ。<a href="https://xakuro.com/blog/wordpress/277" target="_blank" rel="noopener">こんな記事</a>を見つけたので移植しました。利用する際は、id=の部分にid属性に適当な文字列を入れるか、消すかしてください。まだ、ジャンプ機能は実装できていません。

## 開発体制の変化

それとは前後しますが、Githubのレポジトリがmaterブランチとdevブランチのトロイカになりました。今まで、アップデート作業は自動化できていませんでしたが、[WP Puaher](http://wkwkrnht.gegahost.net/sitemanagement/wordpress/piugin/183)との併用でmasterブランチから安定板が自動アップデートできるようになりました。ちなみに、devブランチは、こちらが使っている文字通りの開発版です。プルリクはそちらにお願いします。

## 思いがけない表示崩れ

<blockquote class="twitter-tweet" data-lang="ja" data-align="center">
  <p lang="ja" dir="ltr">
    一部ページに表示崩れが起きております。原因と思しきものは見えましたので明日どうにかします。
  </p>
  <p>
    &mdash; wkwkrnht (<a href="http://twitter.com/wkwkrnht" target="_blank" rel="noopener nofollow">@wkwkrnht</a>) [2016年9月30日](https://twitter.com/wkwkrnht/status/781867596136128512)
  </p>
</blockquote>
というわけでどうにかしました。どういうことが起きていたかというと、少なくとも[こちらのページ](http://wkwkrnht.gegahost.net/delusion/472)で三つ目のブログカード以降が重なって表示されるというものです。原因は、概要の中にHTMLタグが閉じタグなしで紛れ込んだことによるものでした。これを表示するために、使っているライブラリが、そこまで想定してなかったのでしょう。OGPの中で、概要があったらそれを、そうじゃなかったら概要タグから拾う。その程度の対応でしたし。(まあ、UTF-8対応すらされてないのでお察しですが)そんなわけで、キャッシュの値を直接いじることで解消しました。仕組みとしては、[こちら](http://nelog.jp/wordpress-transient)ですので。同様の現象にお会いの方は、データベース内の値をいじってください。site_transit+URLな形で名付けてありますから。おおもとの仕組みにしても、[こちら](https://wp-simplicity.com/suport/topic/%e5%a4%96%e9%83%a8%e3%82%b5%e3%82%a4%e3%83%88%e3%81%aeogp%e3%81%8b%e3%82%89blogcard%e3%82%92%e4%bd%9c%e3%82%8b/)ですからSimplicityの劣化版に近いと思います。共有機能は独自のものですが。

## ナイトモードのバグ修正

実はですね。Google Cookie Choices対応のため、スクリプトを追加したところ動かなくなってしまいました。今のところコメントアウトで対応しています。[ナイトモードの仕組みはこちら。](https://q-az.net/wordpress-night-mode/)[こちら](https://q-az.net/css-in-single-post/)も元々実装していました。なぜ今のタイミングでの公表かというと、[作者様の意向](https://twitter.com/gzzdino/status/779461749636337664)です。

## まとめ

詳細は、コミットログを見てください。
EMBEDLY https://github.com/wkwkrnht/2016-by-wkwkrnht
ちょっと前に、[記事に書いた通り](http://wkwkrnht.gegahost.net/sitemanagement/wordpress/piugin/556)なのですけれども。gegahost.netのセキュリティ意識の高さにやられて、dlver.itすらも連携できていない状況です。何とか、これを打破したいところでございますが、それは、このwordpress上で同等のものを動かすしかありません。それについては追々報告したいと思います。まったく、それを除けば懐が深すぎるいいサービスなんですけどね。

## 参考記事

ついでに覚えているもので実装したものを。

EMBEDLY http://nelog.jp/body_class
EMBEDLY http://nelog.jp/add-quicktags-to-wordpress-text-editor
EMBEDLY http://nelog.jp/expanded-information-css
EMBEDLY http://nelog.jp/no-alt-fix
EMBEDLY http://nelog.jp/rel-next-prev
EMBEDLY http://nelog.jp/copyrights
EMBEDLY http://nelog.jp/category-description-custom
EMBEDLY http://nelog.jp/customize-admin-single-list"
EMBEDLY http://nelog.jp/line-bolloon-css
EMBEDLY http://nelog.jp/human_time_diff"
EMBEDLY http://nelog.jp/theme-custumizer-default-value
EMBEDLY http://nelog.jp/wordpress-customize-related-entries"
EMBEDLY http://nelog.jp/wordpress-time-tag
EMBEDLY http://nelog.jp/wlw-post-downloader-plugin
EMBEDLY http://www.nxworld.net/tips/box-shadow-effect.html
EMBEDLY http://www.nxworld.net/tips/social-logo-svg-code-and-brand-color.html
EMBEDLY http://www.nxworld.net/tips/50-css-heading-styling.html
EMBEDLY http://www.nxworld.net/tips/css-tag-cloud.html
EMBEDLY http://www.nxworld.net/wordpress/wp-post-edit-filter-categories.html
EMBEDLY http://www.nxworld.net/wordpress/wp-admin-customize-excerpt.html
EMBEDLY http://www.nxworld.net/wordpress/wp-post-edit-required.html
EMBEDLY http://www.nxworld.net/wordpress/wp-add-posts-columns.html
EMBEDLY https://webutubutu.com/webdesign/3453

## 有言実行のアップデート(2016-07-30T23:52:18+09:00)

<http://wkwkrnht.gegahost.net/sitemanagement/wordpress/theme/280>{.embedly-card}
<blockquote class="twitter-tweet" data-lang="ja">
  <p lang="ja" dir="ltr">
    Todo:風呂ったらテーマ変える
  </p>
  <p>
    &mdash; wkwkrnht (<a href="http://twitter.com/wkwkrnht" target="_blank" rel="noopener nofollow">@wkwkrnht</a>) [2016年7月30日](https://twitter.com/wkwkrnht/status/759379058836647936)
  </p>
</blockquote>
上記やらなんやらでずっと新テーマをつくってるとは言ってましたが、ようやく公開できるレベルになりましたのでリニューアルです。以下にサマリーを。

  * 常に画面下に固定のメニュー+1カラムの構成
  * メニューからは共有とウィジェットやナビにアクセス
  * コンセプトはできるだけシンプルに
  * AMP対応やうざい程のプロフやブログカードは引き継ぎ
  * アナリティクスはHTML入力しなきゃダメなように
  * OGP.phpなブログカード試験導入

これぐらいかな
EMBEDLY http://wkwkrnht.gegahost.net
まあおいおい機能は追加していきます。