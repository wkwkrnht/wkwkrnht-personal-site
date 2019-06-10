---
id: 497
title: '200KBは厳しい&javascriptやらなきゃな話'
date: 2016-09-27T00:22:03+09:00
author: wkwkrnht
layout: post
guid: http://wkwkrnht.gegahost.net/?p=497
permalink: /sitemanagement/accelerated/497/
categories:
  - 高速化
tags:
  - API
  - gegahost.net
  - javascript
  - JSON
  - PHP
  - ping
  - WordCamp
  - WordCamp Tokyo
  - wordpress
  - サイト運営
  - ブログ
---
<del datetime="2018-01-21T13:12:02+00:00">(なんかちょっと前に、こいつ移転するぞ詐欺やってなかったけってお思いの皆さん。正しい。実に正しい。サーバーのセッション数管理が煩かったことに起因するものでした。でも、移転したところでサイトの表示速度は落ちるんですよね。そんなこんなで帰ってきました。)</del>

## 1ページ200KBまで

今回は高速化、最適化がお題です。いやあ、この前のWordCamp Tokyoでそんな話があったと聞いて。  

EMBEDLY http://www.slideshare.net/takehora/wordpress-66116820

いやあスライド見たら、はっきり書いてありますね。モバイル向けページは、200KB以内にページサイズを抑えろって。ココのブログは、広告も張ってないのでまだ目指しやすいのですけどね。これといったことはしていなくて。gZipとキャッシュを.htaccessで設定しているだけです。実はGoogle先生にも反応遅いと怒られるgegahost.netよりも、xdomain系列のほうが、.htaccess周りの制限のせいで遅くなってしまうんです。おまけに、強制広告表示ですし。<a href="http://fwww7.com/2015/06/25/xdomain%E3%81%AEwordpress%E3%82%B5%E3%82%A4%E3%83%88%E3%82%92gzip%E5%9C%A7%E7%B8%AE%E3%81%95%E3%81%9B%E3%82%8B%E6%96%B9%E6%B3%95%E3%82%92%E7%B4%B9%E4%BB%8B%E3%83%BE%E2%88%80%EF%BD%80" title="" target="_blank" rel="noopener"></a>こんな記事[/link]もあるんですけど、事実上ムリです。せめてKUSANAGIで動かしてる。だったら結果は違ったかもしれませんが。

あとは、オリジナルテーマでの努力です。.cssファイルまとめたり。画像なしの関連記事表示を作ったり。しまいには、onclick属性にネイティブスクリプト書いてみたり。そんなこんな、ちまりちまりと努力しています。たぶん次に確実に効果ありそうなのは、強制インライン化でしょうねぇ。他のは、ちょっときついですし。そいなわけで、暇なかたはときたまこのサイトをスピテスしてやってください。ついに幻でも、100%の表示が見えたんです！おそらく80以上は、安定して出ますから。

<blockquote class="twitter-tweet" data-lang="ja">
  <p lang="ja" dir="ltr">
    まごうことなき100%<br />Latest Performance Report for: <a href="https://t.co/2w0gcsDVXe">https://t.co/2w0gcsDVXe</a> | GTmetrix <a href="https://t.co/SXVIGE4cmY">https://t.co/SXVIGE4cmY</a>
  </p>

  <p>
    &mdash; wkwkrnht (<a href="http://twitter.com/wkwkrnht" target="_blank" rel="noopener nofollow">@wkwkrnht</a>) <a href="https://twitter.com/wkwkrnht/status/774586605898113024">2016年9月10日</a>
  </p>
</blockquote>

<a href="https://ja.wordpress.org/plugins/minify-html-markup" title="" target="_blank" rel="noopener"></a>こんなの[/link]導入してみましたけど、これでさえ限界もあるわけで。そう考えると、本当にq-azはすごいなぁと。私も、そこまでもっていきたいなぁ。そのためにも、もうちょっと関数の依存関係見直したり、lightboxやアイコンフォントの当て方なんかも考えなきゃいけないなぁと思ったり。普通に、動作環境はEdge、Firefox、Chrome、Safari辺りに絞っている。だからこそ、もっとCSSも簡略化できるはずなのは確かだし、.eotファイルなんて読み込まなくてもいいのはその通りで。まあただの愚痴っちゃあ、愚痴なんですけど。海外サーバーを使う身として、それぐらいは頑張りたいなと。GTmetrixのデフォで測ってみるとロスは少ないけど、日本ではpingが不利すぎだし。CDNでも借りたらそれだけで満足できそうw

## javascriptに移ろう

こちらもWordCamp Tokyoのセッションネタ。

<script async class="speakerdeck-embed" data-id="e72bc3c5fabd4e5a8b7afdf270dd732f" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>
<iframe width="560" height="315" src="https://videopress.com/embed/Cev3rb2C" frameborder="0" allowfullscreen></iframe>
<script async src="https://videopress.com/videopress-iframe.js"></script>

こんな感じです。要約すると、WordpressでもJSONベースのAPI構築できるようになるから、Wordpressは本来のCMSとしての動きのみに使えるよね。だから、もう他のことはjavascriptで出来るんだし、コダワリは捨てよーぜ。な感じ。これも衝撃だったなぁ。もちろんプラグインの存在は知っていって、javascriptの偉大さも感じていて、私の思っている地球一周先を行かれていた感じでしたね。ちょっとブレはありますけど、でも次のサイトも、PHPベースなのは変わらず。そこに、初めましてのPHPライブラリとJSONの扱いというに点があるから、それをステップにしようかなと。次は、それベースでサイト表示もjavascriptベースに、ツイートを、スクレイピングをって。どんどんリライトしていけば、ちょっとは、このセッションの紹介事例に近づけるかなと。それでも、スクレイピングは自動的に行うにはCronジョブしか方法が……。気合とハッスルが足りるかどうか。そのためにも、いったんこっちのブログのコンテンツを落ち着かせないとというのもありまして。書きたいけど書いてないネタが、ちらほらあるんですよね。それ書かないと。そんな感じで、今日はとりあえず寝ます。