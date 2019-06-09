---
id: 2292
title: Google Play Musicの不可解な仕様
date: 2017-03-25T21:22:53+09:00
author: wkwkrnht
layout: post
guid: http://wkwkrnht.wp.xdomain.jp/?p=2292
permalink: /music/google-play-music/2292/
snap_isAutoPosted:
  - "1"
snap_MYURL:
  - ""
snapEdIT:
  - "1"
snapWP:
  - |
    s:298:"a:1:{i:0;a:9:{s:2:"do";s:1:"1";s:10:"msgTFormat";s:7:"%TITLE%";s:9:"msgFormat";s:21:"%URL%
    %HTAGS%
    %IMG%";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:8:"isPosted";s:1:"1";s:4:"pgID";s:3:"783";s:7:"postURL";s:37:"https://wkwkrnht.wordpress.com/?p=783";s:5:"pDate";s:19:"2017-03-25 12:23:06";}}";
snapFB:
  - |
    s:410:"a:1:{i:0;a:11:{s:2:"do";s:1:"1";s:9:"msgFormat";s:38:"更新:%URL% - %TITLE%
    %HTAGS%
    %IMG%";s:8:"postType";s:1:"I";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:8:"isPosted";s:1:"1";s:4:"pgID";s:33:"1191820534203303_1407289542656400";s:7:"postURL";s:63:"http://www.facebook.com/1191820534203303/posts/1407289542656400";s:5:"pDate";s:19:"2017-03-25 12:23:09";}}";
snapTW:
  - |
    s:386:"a:1:{i:0;a:11:{s:2:"do";s:1:"1";s:9:"msgFormat";s:38:"更新:%TITLE% - %URL%
    %HCATS%
    %IMG%";s:8:"attchImg";s:1:"1";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:8:"isPosted";s:1:"1";s:4:"pgID";s:18:"845612015074750465";s:7:"postURL";s:54:"https://twitter.com/wkwkrnht/status/845612015074750465";s:5:"pDate";s:19:"2017-03-25 12:23:09";}}";
categories:
  - Google Play Music
tags:
  - Google
  - Google Play Music
  - ハウツー
  - 不具合
---
<div class="ogp-blogcard">
  <blockquote cite="https://play.google.com/store/music?hl=ja">
    <img class="ogp-blogcard-img" src="" /> <a href="https://play.google.com/store/music?hl=ja" target="_blank" rel="noopener" tabindex="0" title="Google Play の音楽" class="ogp-blogcard-info"> 
    
    <h6 class="ogp-blogcard-title">
      Google Play の音楽
    </h6>
    
    <p class="ogp-blogcard-description">
      いつでもどこでも、お使いのデバイスで何百万もの最新の Android アプリ、ゲーム、音楽、映画、テレビ番組、書籍、雑誌などを楽しめます。
    </p></a>
  </blockquote>
  
  <ul class="ogp-blogcard-share">
    <li>
      <a href="https://twitter.com/share?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fmusic%3Fhl%3Dja&text=Google Play の音楽" target="_blank" rel="noopener" tabindex="0" class="fab fa-twitter" title="Twitterへ共有する"></a>
    </li>
    <li>
      <a href="http://www.facebook.com/share.php?u=https%3A%2F%2Fplay.google.com%2Fstore%2Fmusic%3Fhl%3Dja" target="_blank" rel="noopener" tabindex="0" class="fab fa-facebook-f" title="facebookrへ共有する"></a>
    </li>
    <li>
      <a href="http://getpocket.com/edit?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fmusic%3Fhl%3Dja&title=Google Play の音楽" target="_blank" rel="noopener" tabindex="0" class="fab fa-get-pocket" title="pocketへ共有する"></a>
    </li>
    <li>
      <a href="http://b.hatena.ne.jp/add?mode=confirm&url=https%3A%2F%2Fplay.google.com%2Fstore%2Fmusic%3Fhl%3Dja&title=Google Play の音楽" target="_blank" rel="noopener" tabindex="0" title="はてブへ共有する"> B! </a>
    </li>
  </ul>
</div>

<a href="" title="ここ" target="_blank" rel="noopener">ここ</a>に書いた通り、SCV32のワナに嵌ってしまった<a href="http://twitter.com/wkwkrnht" target="_blank" rel="noopener nofollow">@wkwkrnht</a>です。それの検証の最中、音楽ファイルをいつものSDカード以外に復元する必要があり、復元元としてGoogle Play Musicを選んだのですが、これが失敗でした。という話です。元々、Google Play musicは、何かあったとき用にCDから取り込んだ全音楽ファイルと、クーポンで買った音源とが保存されていました。ようは、私にとって手持ちの全音源のバックアップとなっていました。もちろん無料プランです。これらを前提として書いていきますね。

<aside class="toc" role="navigation">
  <h2 class="toc-title">
    目次
  </h2>
  
  <ol id="toc-inner" class="toc-list block">
    <li>
      <a href="#toc1" tabindex="0">曲目</a>
    </li>
    <ol>
      <li>
        <a href="#toc2" tabindex="0">松本 孝弘</a>
      </li>
      <ol>
        <li>
          <a href="#toc3" tabindex="0">EP</a>
        </li>
        <li>
          <a href="#toc4" tabindex="0">メタリカ</a>
        </li>
        <li>
          <a href="#toc5" tabindex="0">Led Zeppelin</a>
        </li>
        <li>
          <a href="#toc6" tabindex="0">ANGRA</a>
        </li>
        <li>
          <a href="#toc7" tabindex="0">T-SQUARE&THE SQUARE</a>
        </li>
        <li>
          <a href="#toc8" tabindex="0">Casiopea vs The Square</a>
        </li>
        <li>
          <a href="#toc9" tabindex="0">Jimsaku</a>
        </li>
        <li>
          <a href="#toc10" tabindex="0">Casiopea</a>
        </li>
        <li>
          <a href="#toc11" tabindex="0">アニソン</a>
        </li>
        <ol>
          <li>
            <a href="#toc12" tabindex="0">ペルソナ4シリーズ</a>
          </li>
          <li>
            <a href="#toc13" tabindex="0">悪魔のリドル</a>
          </li>
        </ol>
        
        <li>
          <a href="#toc14" tabindex="0">fripSide</a>
        </li>
        <li>
          <a href="#toc15" tabindex="0">μ's</a>
        </li>
        <li>
          <a href="#toc16" tabindex="0">茅原 実里</a>
        </li>
        <li>
          <a href="#toc17" tabindex="0">坂本 真綾</a>
        </li>
        <li>
          <a href="#toc18" tabindex="0">田村 ゆかり姫</a>
        </li>
        <li>
          <a href="#toc19" tabindex="0">堀江 由衣</a>
        </li>
        <li>
          <a href="#toc20" tabindex="0">喜多村 英梨</a>
        </li>
        <li>
          <a href="#toc21" tabindex="0">上坂 すみれ</a>
        </li>
        <li>
          <a href="#toc22" tabindex="0">三澤 紗千香</a>
        </li>
        <li>
          <a href="#toc23" tabindex="0">鷲崎 健×三澤 紗千香</a>
        </li>
        <li>
          <a href="#toc24" tabindex="0">鷲崎 健</a>
        </li>
        <li>
          <a href="#toc25" tabindex="0">遠藤会</a>
        </li>
        <li>
          <a href="#toc26" tabindex="0">JAM Project</a>
        </li>
        <li>
          <a href="#toc27" tabindex="0">Vocaloid</a>
        </li>
        <li>
          <a href="#toc28" tabindex="0">ソニー</a>
        </li>
      </ol>
      
      <li>
        <a href="#toc29" tabindex="0">まとめ</a>
      </li>
    </ol>
  </ol>
</aside>

## 問答無用、強制的にアーティストベースでのファイル分類

処理場の都合なんですかね。アーティストで分類してから、その下にアルバム名で分類されるという具合です。まあ、違うアーティストで、同名アルバムがあって、それが違うアルバムだった場合、賢い実装だと思いますが、違うアーティストが一つのアルバムを作る場合とどちらが多いのでしょうか。というか、機械学習を取り入れるなら、真っ先にここでしょう。ここで、同じアルバムを認識して、それを基にきちんとフォルダ分けをする。これだけでだいぶUXが上がると思いますよ。

## 同じアルバムなのに違うアルバムと認識される事態

たぶん、これは上記の仕様からモロに煽りを受けたものだと思われます。上記の仕様のせいで、同じアルバムなのに、違うフォルダーに保存されているため、再生アプリ側が誤認識するという具合でして。それと同時に、アルバムアーティストも変更となっているかのせいも高いため、そちらも原因だと思われます。結果として、手作業でフォルダー統合し、アルバムアーティストも直さなければいけません。

## フォルダー名ぶつ切り事件

これも処理上の都合だと思いますけれども、ある一定の文字数を超えたアルバムは、単語に関係なくバッサリと切られていて、それがフォルダー名として使われていました。○○ 青盤とかの下何文字でバージョン分けしている場合、見分けがつかなくなるという仕様ですね。これは、制作者に対して敬意がないというかかんというか、という感じでして。実務上も十二分に不便ですね。タグ上では、全部残されているのがまだ救いですけれども。さすがに、これはどうかなと思う次第です。

## まとめ

これらの仕様を全部体験できるのが、けいおんのCome with Me!なので、ぜひ試していただきたいですね。十中八九、この仕様を決定した人に対して、怒りを覚えますから。少なくとも私はそうでした。向こうから言わせれば、ちゃんとクラウド経由で聞いてくれよ。ということなのでしょうが、わざわざトラフィックを増やすことでもないですし、スリープタイマーの階層も深いので、プレイヤーを使いたいとも思いませんし。というわけで、邦楽やコントリビュートアルバムなんかを聞く方々は気を付けた方がいいかと思います。真面目に、修正に数時間かかりますから。