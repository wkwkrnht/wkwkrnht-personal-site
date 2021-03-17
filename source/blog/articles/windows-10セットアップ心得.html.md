---
title: Windows 10セットアップ心得
date: 2020-10-09T01:13:52.615Z
author: wkwkrnht
tags:
  - Windows
  - Windows10
  - Vivaldi
  - Git
  - Github
  - OBS
  - IME
  - トラックボール
  - エレコム
  - OneDrive
  - MS365
---
なぜいまさらこんなテーマを書こうかという言いますのは、ハイスペックモバイルを担っているUH75がクリーンインストール以外では、1909より先に行くことができなくなっているためです。ですから、ここにリンク集的に、いつも入れる残しておこうという試みです。今もこれで書いているのですが、入力の取りこぼしが出たりと大変つらい状態ですな。

## Win10

最初にアップデートの類をすべて終わらせる。プライバシー権限管理と不要ショートカットのお掃除は必須。設定は同期されるはずだから無問題。気になるときは、MSストア立ち上げて放置。

### アカウント管理

ここから、アカウント入力開始。Outlookが、メイン(ドメイン2つ)、サブ(ドメイン2つ)、サブサブ(ドメイン2つ)、wiki用。Gmailが、メイン、サブ、サブサブ、サブサブサブ、サブサブサブサブ、wiki用。プロパイダも忘れずに。

その後、目的別に受信トレイ整理。

## ユーティリティ

### Google 日本語入力

EMBEDLY https://www.google.co.jp/ime/

送信情報、辞書同期の確認、[言語バー表示](https://faq.nec-lavie.jp/qasearch/1007/app/servlet/qadoc?QID=017772)の設定を忘れずに。ネイティブで、メインIMEとしたらMS-IME削除。

### Microsoft 365

EMBEDLY https://www.office.com

ログインして順当に進めば永年版のほうが現れるから、そっちをインスコ。OneDrive含めダブルログインを忘れずに。[OneDriveは同期場所移設](https://www.atmarkit.co.jp/ait/articles/1502/06/news116.html)が必要になる。

### Vivaldi

EMBEDLY https://vivaldi.com/ja/

ログインしてから、同期前にテーマは以下を参照して設定。

![Vivaldiのテーマ設定](https://res.cloudinary.com/wkwkrnht/image/upload/v1602205115/2020-10-09_09.56.10_vivaldi_869203dce0dd_logb06.png)

その後、Webパネルの設定。順番は、vivaldi://settings/general、NHK(全国、居住地域)、[日経](https://r.nikkei.com/)、地元紙、[Twitter](https://twitter.com/home)、[Instagram](https://www.instagram.com/)、[YT Music](https://music.youtube.com/)、[YT](https://www.youtube.com/)、[Wolfram](https://ja.wolframalpha.com/)、[コンビニWebプリント](https://networkprint.ne.jp/sharp_netprint/ja/top.aspx)、[翻訳](https://translate.google.co.jp/?hl=ja)、諸々となる。YTはピン留めも忘れずに。

### エレコムマウスアシスタント

EMBEDLY https://www.elecom.co.jp/support/download/peripheral/mouse/assistant/win/

インストールしたら、設定ファイルを他のPCから移植。

## サイト更新用

### ATOM

EMBEDLY https://atom.io

sync-settingsセットアップ。[Github](https://github.com)でシークレットを都度生成しなければいけない。ワークフォルダーを設定するのも忘れずに。

## SourceTree

EMBEDLY https://www.sourcetreeapp.com

ログイン道中にTOTPあり。設定で、自動コミット、ログ表示をONに。AtomのGithub連携で事足りているフシがあるので、bitbucketなしなら入れなくても良いかも。

## Web会議対策

### OBS

EMBEDLY https://obsproject.com/ja

テレカン用は、背景、「NO SIGNAL」のテロップ、カメラ、各会議ソフト。音声はミキサー入れてから。Intel用エンコード設定は、未知のため要検証。

### VoiceMeeter Banana

EMBEDLY https://vb-audio.com/Voicemeeter/banana.htm

扱うデータを192kHz、24bitにする必要。ルーティングは、仮想入力は物理出力に全開放、B1物理入力、B2仮想入力。G533のみゲートが0.8。ライン入力以外はモノラル入力。最後に音量調整。

### XSplit Vcam

EMBEDLY https://www.xsplit.com/ja

ログインして、背景を透明に変えるだけ。