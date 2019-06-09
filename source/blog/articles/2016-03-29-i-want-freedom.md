---
id: 230
title: 単なるメモ群
date: 2016-03-29T18:40:43+09:00
author: wkwkrnht
layout: post
guid: http://wkwkrnht.gegahost.net/?p=230
permalink: /sitemanagement/serverhostingservice/230/
onesignal_meta_box_present:
  - ""
  - ""
  - ""
onesignal_send_notification:
  - ""
  - ""
  - ""
cwp_meta_box_check:
  - 'No'
  - 'No'
  - 'No'
snap_MYURL:
  - ""
snapEdIT:
  - "1"
snapFB:
  - |
    s:225:"a:1:{i:0;a:8:{s:2:"do";s:1:"1";s:9:"msgFormat";s:38:"更新:%URL% - %TITLE%
    %HTAGS%
    %IMG%";s:8:"postType";s:1:"I";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:4:"doFB";i:0;}}";
snapTW:
  - |
    s:225:"a:1:{i:0;a:8:{s:2:"do";s:1:"1";s:9:"msgFormat";s:38:"更新:%TITLE% - %URL%
    %HCATS%
    %IMG%";s:8:"attchImg";s:1:"1";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:4:"doTW";i:0;}}";
snapWP:
  - |
    s:328:"a:1:{i:0;a:12:{s:11:"isPrePosted";s:1:"1";s:8:"isPosted";s:1:"1";s:4:"pgID";s:3:"677";s:5:"pDate";s:19:"2016-11-03 10:10:07";s:2:"do";s:1:"0";s:10:"msgTFormat";s:7:"%TITLE%";s:9:"msgFormat";s:21:"%URL%
    %HTAGS%
    %IMG%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:4:"doWP";i:0;}}";
image: /wp-content/uploads/2016/08/rt.png
categories:
  - サーバーホスティングサービス
tags:
  - gegahost.net
  - how-to
  - サイト運営
  - ハウツー
  - ブログ
  - 不具合
  - 推測
---
## embed.lyの構造

[<img title="201603281841" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; display: inline; padding-right: 0px"  alt="201603281841" src="http://wkwkrnht.gegahost.net/wp-content/uploads/2016/03/201603281841_thumb.png" width="244" height="105" />](http://wkwkrnht.gegahost.net/wp-content/uploads/2016/03/201603281841.png)[<img title="201603281845" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px"  alt="201603281845" src="http://wkwkrnht.gegahost.net/wp-content/uploads/2016/03/201603281845_thumb.png" width="244" height="99" />](http://wkwkrnht.gegahost.net/wp-content/uploads/2016/03/201603281845.png)[<img title="201603281842" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px"  alt="201603281842" src="http://wkwkrnht.gegahost.net/wp-content/uploads/2016/03/201603281842_thumb.png" width="244" height="111" />](http://wkwkrnht.gegahost.net/wp-content/uploads/2016/03/201603281842.png)[<img title="201603281844" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px"  alt="201603281844" src="http://wkwkrnht.gegahost.net/wp-content/uploads/2016/03/201603281844_thumb.png" width="244" height="111" />](http://wkwkrnht.gegahost.net/wp-content/uploads/2016/03/201603281844.png)わかる人にだけ

## I want freedom.

ええとですね、どこの業界にも無制限には裏がある。タダより高いものは無い。は通用するという話です。私がこのサーバーにブログを移転させたのは、ストレージへの不安を無くしたいからでした。ところが、実際、このgegahost.netというサーバーは1ファイルにつき約10MBという制限を設けていたのです。普通に考えたら、マイクロソフトもCopyも無制限サービスを有料でも運営できないのに無料で使える訳ないですよね……。というのも、<a href="http://twitter.com/wkwkrnht" target="_blank" rel="noopener nofollow">@wkwkrnht</a>の方はツイログに登録するのが遅かったために、過去ツイートを検索するのに手間がかかる状態になっております。そうなると、自分が過去の情報やらツイートやら探すのがくそ面倒。さらに、新規フォロワー諸氏に自己紹介が詳しく出来ないというのもあり、ツイッターのツイート履歴ダウンロードサービス経由でJSON形式のデータとCSV形式のデータをゲットしてきたわけです。その際に、JSONデータとCSVデータどちらでも先述の制限が立ちはだかり、いまだ公開状態にないのです。そこで、外部サーバーをCDNとして使用するのが手っ取り早いのですが、今のところ丁度いいものが見つかっておりません。また、ついでにモダンな感じで表示できたらなぁー。という感じです。とりとめのないメモ代わりの記事でしたが、読んでくださってありがとうございました。

そういえばAPI1.1で厳しくなったTwitterの規制のハナシ。Twitterで(リ)ツイートし過ぎで規制をかけられる私。ふと思った訳です。条件は何だろう、とそれで(肌感覚で)計ってみた結果、

  * 300ツイート/1Hぐらいすると規制がかかる
  * 二時間程度で解ける

の二点が判明しました。これらの条件からだと、頑張って2400ツイート/dayぽいですね。あやふやですけれども随時追記して今後の運営(何の)に役立てられたらと思います。KuroTwiとかびよーんったー、TwitTimeで、API残数なり規制開け時刻(推定)を知れるとは、いい時代になったと思います。

ー追伸ー ツイログがJSON形式のデータインポートに対応しますように。