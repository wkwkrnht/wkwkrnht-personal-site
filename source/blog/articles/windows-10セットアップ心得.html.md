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
---
なぜいまさらこんなテーマを書こうかという言いますのは、ハイスペックモバイルを担っているUH75がクリーンインストール以外では、1909より先に行くことができなくなっているためです。ですから、ここにリンク集的に、いつも入れる残しておこうという試みです。今もこれで書いているのですが、入力の取りこぼしが出たりと大変つらい状態ですな。

## Win10

最初にアップデートの類をすべて終わらせる。プライバシー権限管理と不要ショートカットのお掃除は必須。設定は同期されるはずだから無問題。

### アカウント管理

ここから、アカウント入力開始。Outlookが、メイン(ドメイン2つ)、サブ(ドメイン2つ)、サブサブ(ドメイン2つ)、wiki用。Gmailが、メイン、サブ、サブサブ、サブサブサブ、サブサブサブサブ、wiki用。プロパイダも忘れずに。

その後、目的別に受信トレイ整理。

## ユーティリティ

### Google 日本語入力

EMBEDLY https://www.google.co.jp/ime/

送信情報、辞書同期の確認、言語バー表示の設定を忘れずに。

### Microsoft 365

EMBEDLY https://www.office.com

ログインして順当に進めば永年版のほうが現れるから、そっちをインスコ。OneDrive含めダブルログインを忘れずに。OneDriveは同期場所移設が必要になる。

### Vivaldi

EMBEDLY https://vivaldi.com/ja/

ログインしてから、同期前にテーマは以下を参照して設定。

![Vivaldiのテーマ設定](https://res.cloudinary.com/wkwkrnht/image/upload/v1602205115/2020-10-09_09.56.10_vivaldi_869203dce0dd_logb06.png)

その後、Webパネルの設定。順番は、vivaldi://settings/general、NHK(全国、居住地域)、日経、地元紙、Twitter、Instagram、YT Music、YT、翻訳、Wolfram、コンビニWebプリント、諸々となる。

## サイト更新用

### ATOM

EMBEDLY https://atom.io

sync-settingsセットアップ。Githubでシークレットを都度生成しなければいけない。ワークフォルダーを設定するのも忘れずに。

## SourceTree

EMBEDLY https://www.sourcetreeapp.com

ログイン道中にTOTPあり。設定で、自動コミット、ログ表示をONに。AtomのGithub連携で事足りているフシがあるので、bitbucketなしなら入れなくても良いかも。

## Web会議対策

### OBS

EMBEDLY https://obsproject.com/ja

テレカン用は、背景、「NO SIGNAL」、カメラ、各会議ソフト。音声はミキサー入れてから。Intel用エンコード設定は、未知のため要検証。

### VoiceMeeter Banana

EMBEDLY https://vb-audio.com/Voicemeeter/banana.htm

扱うデータを192kHz、24bitにする必要。ルーティングは、仮想入力は物理出力に全開放、B1物理入力、B2仮想入力。G533のみゲートが0.8。ライン入力以外はモノラル入力。最後に音量調整。