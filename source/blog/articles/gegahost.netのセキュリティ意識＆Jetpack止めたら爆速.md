---
id: 556
title: gegahost.netのセキュリティ意識＆Jetpack止めたら爆速
date: 2016-10-05T19:03:47+09:00
author: wkwkrnht
layout: post
guid: http://wkwkrnht.gegahost.net/?p=556
permalink: /sitemanagement/wordpress/piugin/556/
categories:
  - プラグイン
tags:
  - HTML圧縮
  - jetpack
  - SNS
  - wordpress
  - wordpress.com
  - お知らせ
  - サイトマップ
  - サイト運営
---
EMBEDLY http://wkwkrnht.gegahost.net/sitemanagement/security/544

先日、こんな記事を書きました。そこで、ちょっと思い出したことがあるので、記録に残しておきたいと思います。

  1. 被XSS禁止
  2. scriptタグを含む文章を、Wordpress経由では保存不可
  3. EWWW Image Optimizerは使えない(exec()が使えない)
  4. アップロードサイズは、10MBまで

これらは、おそらく非公開情報です。さらに、最後以外は実際に使ってみないとわからないものです。以前、<a href="http://wkwkrnht.gegahost.net/sitemanagement/serverhostingservice/18" target="_blank" rel="noopener">こんな記事</a>でべた褒めしていますが、こんな罠もあるのでご注意を。特に一番上は、どうにもならないものなので諦めが肝心です。

## Jetpackのお話

Jetpackとは、Wordpressにおける何でも屋。投稿時共有やサイトマップ作成、モバイル向けテーマなど様々な機能を提供しています。それゆえ、読み込みされるものを制御するには、一々functions.phpにコードを付け足す始末でした。その上、サイト解析用のコンポネートは複数読み込まれる始末。そんな訳で、使用していたのが、

  1. サイト解析機能
  2. 投稿と同時にSNS共有する機能
  3. サイトマップ作成機能

の三つのみだったため、それぞれ移行しました。移行先のプラグイン・サービスは、

[appbox wordpress social-networks-auto-poster-facebook-twitter-g]  
[appbox wordpress google-sitemap-generator]  

EMBEDLY https://www.monitoring-plus.jp

どれもポピュラーなものですね。ほかに、詳しい記事があるはずなので省略。これで、サイト読み込みが若干早くなり、ページスピードテストの点数も上がりました。ぜひ、計ってみてください。NoAdsの実力が見れますから。海外サーバーである分、できる限りの高速化を重ねていきたいと思います。

### ついでに導入したプラグイン

[appbox wordpress minify-html-markup]