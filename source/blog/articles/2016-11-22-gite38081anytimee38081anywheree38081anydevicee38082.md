---
id: 647
title: Git、Anytime、Anywhere、Anydevice。
date: 2016-11-22T01:26:19+09:00
author: wkwkrnht
excerpt: Android上で動くGitクライアントを探しているそこのあなた、この記事に3つの解法が載っています。選ぶかどうかは、あなた次第です。道しるべとならんことを。
layout: post
guid: http://wkwkrnht.gegahost.net/?p=647
permalink: /android/app/647/
snap_isAutoPosted:
  - "1"
  - "1"
snapBG:
  - 's:43:"a:1:{i:0;a:1:{s:11:"isPrePosted";s:1:"1";}}";'
  - 's:43:"a:1:{i:0;a:1:{s:11:"isPrePosted";s:1:"1";}}";'
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
    s:442:"a:1:{i:0;a:14:{s:2:"do";s:1:"1";s:11:"SNAPformatT";s:15:"%TITLE% %HTAGS%";s:10:"SNAPformat";s:46:"<a class="embedly-card" href="%URL%">%URL%</a>";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:4:"doWP";i:0;s:11:"isPrePosted";s:1:"1";s:8:"isPosted";s:1:"1";s:4:"pgID";s:3:"737";s:5:"pDate";s:19:"2016-11-21 16:26:47";s:10:"msgTFormat";s:7:"%TITLE%";s:9:"msgFormat";s:21:"%URL%
    %HTAGS%
    %IMG%";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";}}";
categories:
  - アプリ
tags:
  - AIDE
  - Android
  - ASUS
  - Git
  - Github
  - IDE
  - Linux
  - Samsung
  - Vim
---
大仰なタイトルを付けましたが、要は、Android端末でもGitクライアントになれるよ。ってことです。WindowsやらほかのLinuxディストリビューションやらはたいてい解説さｒｒてるだろうし。

## 単なるクライアント、コードエディター、IDEどれがお好み？

うれしいことにいずれもあります。順に説明していきますね。

### まずは、単なるクライアント

<div class="ogp-blogcard">
  <blockquote cite="https://play.google.com/store/apps/details?id=com.aor.pocketgit">
    <img class="ogp-blogcard-img" src="https://lh3.googleusercontent.com/8qvDvcpHPe733904Y2Qezi_QKRD0mq9VYyk1QXLr28vDHXcSOu3IdcZ1yNzAPWqdlbs" /> <a href="https://play.google.com/store/apps/details?id=com.aor.pocketgit" target="_blank" rel="noopener" tabindex="0" title="Pocket Git - Apps on Google Play" class="ogp-blogcard-info"> 
    
    <h6 class="ogp-blogcard-title">
      Pocket Git - Apps on Google Play
    </h6>
    
    <p class="ogp-blogcard-description">
      Pocket Git is a powerful standalone Git client for Android with the following features: ★ Simple interface. ★ Clone repositories. ★ Support HTTP and SSH protocols. ★ Passwords and private keys (with passphrase). ★ Automatically capture Github and Bitbucket links. ★ Checkout local and remote branches, individual commits and tags. ★ Stage, unstage and commit. ★ Merge, create and delete branches. ★ Create and delete tags. ★ Create files and folders. ★ Edit files in a external editor (e.g. DroidEdit). ★ Revert changes to single files or complete working tree. ★ Push, pull and fetch from remotes. ★ Projects with more than one remote. ★ Graphical log. ★ View differences before commiting. ★ View differences for each commit. ★ View differences, for any file, between current working tree and HEAD.
    </p></a>
  </blockquote>
  
  <ul class="ogp-blogcard-share">
    <li>
      <a href="https://twitter.com/share?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aor.pocketgit&text=Pocket Git - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" class="fab fa-twitter" title="Twitterへ共有する"></a>
    </li>
    <li>
      <a href="http://www.facebook.com/share.php?u=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aor.pocketgit" target="_blank" rel="noopener" tabindex="0" class="fab fa-facebook-f" title="facebookrへ共有する"></a>
    </li>
    <li>
      <a href="http://getpocket.com/edit?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aor.pocketgit&title=Pocket Git - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" class="fab fa-get-pocket" title="pocketへ共有する"></a>
    </li>
    <li>
      <a href="http://b.hatena.ne.jp/add?mode=confirm&url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aor.pocketgit&title=Pocket Git - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" title="はてブへ共有する"> B! </a>
    </li>
  </ul>
</div>

探せばほかにもあるのでしょうが、アプデが最近まである、4.1にも対応しているなど条件をかけていくとこれしかありません。それでも、一般に必要であると思われる機能を、通り一遍揃えてはいるのでおススメです。ぜひ配られたクレジットで購入してみてください。

### こんどは、コードエディター

<div class="ogp-blogcard">
  <blockquote cite="https://play.google.com/store/apps/details?id=com.aor.droidedit.pro">
    <img class="ogp-blogcard-img" src="https://lh4.ggpht.com/QnlZIlxZxQQwb5Oh-gQUZ3ssqGW9OZDMSsRN8awyLIbsgWgfiSfPE_GCPOs4oFW5n0M" /> <a href="https://play.google.com/store/apps/details?id=com.aor.droidedit.pro" target="_blank" rel="noopener" tabindex="0" title="DroidEdit Pro (code editor) - Apps on Google Play" class="ogp-blogcard-info"> 
    
    <h6 class="ogp-blogcard-title">
      DroidEdit Pro (code editor) - Apps on Google Play
    </h6>
    
    <p class="ogp-blogcard-description">
      DroidEdit is a text and source code editor for android tablets and phones with the following features: ★ Syntax Highlighting for several languages (C, C++, C#, Java, HTML, CSS, Javascript, Python, Ruby, Lua, LaTeX, SQL, ...) ★ Several color themes ★ Infinite undo & redo ★ Search & replace ★ Auto & block indentation ★ Keep opened files and changes between sessions ★ Open files directly from dropbox or a file manager ★ Character encoding support ★ Keyboard shortcuts (List below) ★ Share documents with other services (dropbox, email, ...) ★ Preview HTML files in browser ★ Bracket matching ★ Go to line ★ Run Scripts in SL4A directly ★ Configurable Shortcuts Pro version only features: ★ SFTP/FTP support ★ Dropbox, Drive, Box support ★ Custom themes ★ Run external commands through SSH ★ Root mode Using different character encodings: ★ To open a document with a different character encoding than the default: long press the open file button ★ To create a new document with a different character encoding than the default: long press the new file button ★ You can make this behavior the default in the preference screen Long pressing the save document button allows you to save a document with a different filename -------- DroidEdit is specially useful for new generation android tablets with external keyboards like the Asus Transformer. Try Hacker's Keyboard for a developer friendly virtual keyboard. You should try the ad supported DroidEdit Free before buying this app. The ad supported version has exactly the same functionality as the paid version except it doesn't have SFTP support, Dropbox support, Custom themes and root mode. Please rate the app in the market. For bug reports, feature requests or any other subject please use the following contacts: Mail: droideditapp (at) gmail.com Twitter: http://twitter.com/DroidEdit Page: http://www.droidedit.com/ User Support: http://www.droidedit.com/support/ Facebook: http://facebook.com/droidedit
    </p></a>
  </blockquote>
  
  <ul class="ogp-blogcard-share">
    <li>
      <a href="https://twitter.com/share?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aor.droidedit.pro&text=DroidEdit Pro (code editor) - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" class="fab fa-twitter" title="Twitterへ共有する"></a>
    </li>
    <li>
      <a href="http://www.facebook.com/share.php?u=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aor.droidedit.pro" target="_blank" rel="noopener" tabindex="0" class="fab fa-facebook-f" title="facebookrへ共有する"></a>
    </li>
    <li>
      <a href="http://getpocket.com/edit?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aor.droidedit.pro&title=DroidEdit Pro (code editor) - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" class="fab fa-get-pocket" title="pocketへ共有する"></a>
    </li>
    <li>
      <a href="http://b.hatena.ne.jp/add?mode=confirm&url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aor.droidedit.pro&title=DroidEdit Pro (code editor) - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" title="はてブへ共有する"> B! </a>
    </li>
  </ul>
</div>

さっきのと作者は同じです。Android上で動くコードエディターというのも珍しいので、それだけでも価値あるものだと思います。また、FTP接続にも対応しているのでデプロイするときも最悪どうにかなるかも。いずれにしても必買です。

### おまちかねIDE

<div class="ogp-blogcard">
  <blockquote cite="https://play.google.com/store/apps/details?id=com.aide.premium.key">
    <img class="ogp-blogcard-img" src="https://lh6.ggpht.com/KInTSaad_7S9nbx6GknDBC4ZX1j_VNt4AxULnGCCHaKPn9-7Ncbj6oPu0VBot5WPxOI" /> <a href="https://play.google.com/store/apps/details?id=com.aide.premium.key" target="_blank" rel="noopener" tabindex="0" title="AIDE Premium Key - Apps on Google Play" class="ogp-blogcard-info"> 
    
    <h6 class="ogp-blogcard-title">
      AIDE Premium Key - Apps on Google Play
    </h6>
    
    <p class="ogp-blogcard-description">
      Important note for new users: *** The Premium Key is outdated, please use the in-app shop of AIDE instead!*** If you already purchased the app you will be able to continue using it. This is the premium key for the app "AIDE - Android IDE": https://play.google.com/store/apps/details?id=com.aide.ui AIDE is an integrated development environment (IDE) for developing real Android Apps directly on Android devices. This premium key enables the following features: - Saving files in pure Java projects - Saving files in larger Android projects (5+ Java files) - Direct run without user prompt on rooted devices - Git push/commit - APK publishing - Offline SDK Help - Some customization options
    </p></a>
  </blockquote>
  
  <ul class="ogp-blogcard-share">
    <li>
      <a href="https://twitter.com/share?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.premium.key&text=AIDE Premium Key - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" class="fab fa-twitter" title="Twitterへ共有する"></a>
    </li>
    <li>
      <a href="http://www.facebook.com/share.php?u=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.premium.key" target="_blank" rel="noopener" tabindex="0" class="fab fa-facebook-f" title="facebookrへ共有する"></a>
    </li>
    <li>
      <a href="http://getpocket.com/edit?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.premium.key&title=AIDE Premium Key - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" class="fab fa-get-pocket" title="pocketへ共有する"></a>
    </li>
    <li>
      <a href="http://b.hatena.ne.jp/add?mode=confirm&url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.premium.key&title=AIDE Premium Key - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" title="はてブへ共有する"> B! </a>
    </li>
  </ul>
</div>

  


<div class="ogp-blogcard">
  <blockquote cite="https://play.google.com/store/apps/details?id=com.aide.phonegap">
    <img class="ogp-blogcard-img" src="https://lh4.ggpht.com/SdpkSkXVVgTp7bDrUx9nfRGn_e2zLlMm2Lo1k_ryFrAhqqOoon0AGW0Lyq9Urpn65WE" /> <a href="https://play.google.com/store/apps/details?id=com.aide.phonegap" target="_blank" rel="noopener" tabindex="0" title="AIDE IDE for PhoneGap/Cordova - Apps on Google Play" class="ogp-blogcard-info"> 
    
    <h6 class="ogp-blogcard-title">
      AIDE IDE for PhoneGap/Cordova - Apps on Google Play
    </h6>
    
    <p class="ogp-blogcard-description">
      AIDE for PhoneGap is an integrated development environment (IDE) for developing portable PhoneGap Apps directly on Android devices. You can use your exisiting HTML5/CSS/JavaScript web development skills to build Apps which can be quite easily transfered to various mobile platforms. AIDE supports the full edit-compile-run cycle: write code with the feature rich editor offering advanced features like code completion, real-time error checking, refactoring and smart code navigation, and run your App with a single click. AIDE is fully compatible with Eclipse PhoneGap projects. You can just copy the sourcecode to your device and open the Eclipse project in AIDE to start coding. Alternatively you can keep your sourcecode on your Dropbox - AIDE integrates with Dropbox and allows to easily download from your Dropbox and sync back your changes. AIDE can also open Android Studio projects, which follow the default folder structure. AIDE supports GIT for professional development A brief summary of features... Edit-compile-run cycle: - Create a sample App with a single click - Build PhoneGap/Cordova Apps with HTML5/CSS/JavaScript - Use cutom PhoneGap plugins and develop your own - Run your App with a single click - No root access required - Incremental compilation for fast build times - Uses Eclipse .classpath project format for compatibility - Open default Android Studio projects - Integrated LogCat viewer Real-time error checking: - Real time error analyis throughout the whole project as you type - Automatic Quick-Fixes for many errors UI design: - Preview HTML app pages Refactoring: - Rename - Inline variable - Introduce variable Code: - Code formatter - Out-comment code Code navigation: - Goto defintion - Find usages - Goto symbol - Goto class Editor: - Very fast editor even with large files - Code completion for JavaScript and HTML - PhoneGap API help - Syntax highlighting for JavaScript, HTML and CSS - Unlimited Undo/Redo - Pinch zoom - Smart expand selection - Keyboard support with configurable keybindings - UI optimized for small screens to show as much code/content as possible Filebrowser: - Built-in file manager with the most common features: Rename, delete, create file or folder - Dropbox integration - Git integration with Commit/Dicard/Push/Pull/Branch/Merge and SSH support.
    </p></a>
  </blockquote>
  
  <ul class="ogp-blogcard-share">
    <li>
      <a href="https://twitter.com/share?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.phonegap&text=AIDE IDE for PhoneGap/Cordova - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" class="fab fa-twitter" title="Twitterへ共有する"></a>
    </li>
    <li>
      <a href="http://www.facebook.com/share.php?u=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.phonegap" target="_blank" rel="noopener" tabindex="0" class="fab fa-facebook-f" title="facebookrへ共有する"></a>
    </li>
    <li>
      <a href="http://getpocket.com/edit?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.phonegap&title=AIDE IDE for PhoneGap/Cordova - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" class="fab fa-get-pocket" title="pocketへ共有する"></a>
    </li>
    <li>
      <a href="http://b.hatena.ne.jp/add?mode=confirm&url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.phonegap&title=AIDE IDE for PhoneGap/Cordova - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" title="はてブへ共有する"> B! </a>
    </li>
  </ul>
</div>

  


<div class="ogp-blogcard">
  <blockquote cite="https://play.google.com/store/apps/details?id=com.aide.web">
    <img class="ogp-blogcard-img" src="https://lh4.ggpht.com/Yzx1dQIehIWHlusFV0B3G4W_fumkP0CHnoOQhgJDEarAqmGtR_NRDJE3gM7CzfVby14" /> <a href="https://play.google.com/store/apps/details?id=com.aide.web" target="_blank" rel="noopener" tabindex="0" title="AIDE Web - Html,Css,JavaScript - Apps on Google Play" class="ogp-blogcard-info"> 
    
    <h6 class="ogp-blogcard-title">
      AIDE Web - Html,Css,JavaScript - Apps on Google Play
    </h6>
    
    <p class="ogp-blogcard-description">
      AIDE Web is a web editor and integrated development environment (IDE) for developing websites with Html/Css/JavaScript directly on your Android device. Follow interactive coding lessons and step-by-step become an expert web developer. Write code with the feature rich editor with code completion, real-time error checking, refactoring and smart code navigation, and run your websites with a single click. Code JavaScript console applications to sharpen your skills. AIDE Web features interactive lessons with step-by-step instructions to learn JavaScript and web development skills. Follow the lessons, become an expert and apply what you've learned in your own web projects. AIDE will turn your Android tablet with keyboard into a real development box. We use the Transformer Prime to code with AIDE. AIDE will turn your Android Phone into a small development computer to browse and touch your code on the go. A brief summary of features... Learn-to-code (in-app purchase): - Interactive lessons with step-by-step instructions - JavaScript programming course - Web development course - Sample websites Edit-compile-run cycle: - Create a sample website with a single click - Build Html/Css/JavaScript websites - Build pure JavaScript console applications - Run your website with a single click - View your website on other devices/computers in the same Lan - No root access required - Twitter Bootstrap support Real-time error checking: - Real time error analyis throughout the whole project as you type - Automatic Quick-Fixes for many errors Refactoring: - Rename - Inline variable - Introduce variable - Extract method Code: - Code formatter - Out-comment code Code navigation: - Goto defintion - Find usages - Goto symbol Editor: - Very fast editor even with large files - Code completion for JavaScript, Html and Css - Syntax highlighting for JavaScript, Html and Css - Unlimited Undo/Redo - Pinch zoom - Smart expand selection - Keyboard support with configurable keybindings - UI optimized for small screens to show as much code/content as possible Filebrowser: - Built-in file manager with the most common features: Rename, delete, create file or folder - Dropbox integration - Git integration with Commit/Dicard/Push/Pull/Branch/Merge and SSH support.
    </p></a>
  </blockquote>
  
  <ul class="ogp-blogcard-share">
    <li>
      <a href="https://twitter.com/share?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.web&text=AIDE Web - Html,Css,JavaScript - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" class="fab fa-twitter" title="Twitterへ共有する"></a>
    </li>
    <li>
      <a href="http://www.facebook.com/share.php?u=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.web" target="_blank" rel="noopener" tabindex="0" class="fab fa-facebook-f" title="facebookrへ共有する"></a>
    </li>
    <li>
      <a href="http://getpocket.com/edit?url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.web&title=AIDE Web - Html,Css,JavaScript - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" class="fab fa-get-pocket" title="pocketへ共有する"></a>
    </li>
    <li>
      <a href="http://b.hatena.ne.jp/add?mode=confirm&url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.aide.web&title=AIDE Web - Html,Css,JavaScript - Apps on Google Play" target="_blank" rel="noopener" tabindex="0" title="はてブへ共有する"> B! </a>
    </li>
  </ul>
</div>

これらは、もうおなじみですね。一種の様式美です。でも、まだ手を出せてないんですよねぇ。800円以上は覚悟必要で。mazecとかmetamoji、ATOKみたいなやつだと、踏ん切りがつき易いんですけどね。大画面なAndroid機が来るとなれば買いそうですけど。さすがに、4.数インチの画面でコード打ち込もうって気にはならないですよ。それこそZenfone 3 Deluxueの5.7インチモデルとかGalaxy Note 7みたいなやつじゃないと。あれらは、表示領域も抜群、メモリーも潤沢、入力に力入れてるときたもんだ。まあ、それぐらいじゃあないときついぐらいに老眼てことかもしれませんけどね。

## 番外編

<https://sites.google.com/site/fudist/Home/qfixhowm/other-service/howm-android>{.embedly-card} 

今回の記事書くにあたって、みつけたページ。Vim Touchしか知らない私に翼を授けてくれました。Mikutterも動かせそうな勢いです。もう、別な方法が亜確立されてますけどね。AndroidのLinuxである部分は、今後も遺してほしいですね。それを若年層向けの教材にできそうですし。そういうHow-to本ないのかな。あったら人気で売り切れてるか。そんな感じでおしまい。