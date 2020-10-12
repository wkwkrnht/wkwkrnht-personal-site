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

アップデートの類をすべて終わらせる。設定は同期されるはずだから無問題。プライバシー周りと不要ショートカットのお掃除は必須。

## ユーティリティ

### Google 日本語入力

EMBEDLY https://www.google.co.jp/ime/

送信情報、辞書同期の確認、言語バー表示の設定を忘れずに。

### Microsoft 365

EMBEDLY https://www.office.com

ログインして順当に進めば永年版のほうが現れるから、そっちをインスコ。OneDrive含めダブルログインを忘れずに。OneDriveは同期場所移設が必要になる。

### Vivaldi

EMBEDLY https://vivaldi.com/ja/

ログインしてから、テーマ設定。テーマは以下を参照。その後Webパネルの設定。順番は、YT Music、Instagram、Twitter、NHK(全国、居住地域)、地元紙、インプレス、コンビニWebプリント、 所属先関連となる。

![Vivaldiのテーマ設定](https://res.cloudinary.com/wkwkrnht/image/upload/v1602205115/2020-10-09_09.56.10_vivaldi_869203dce0dd_logb06.png)

## サイト更新用

### ATOM

EMBEDLY https://atom.io

sync-settingsセットアップ。Githubでシークレットを都度生成しなければいけない。レポジトリをワークフォルダーとするのも忘れずに。

## SourceTree

EMBEDLY https://www.sourcetreeapp.com

ログイン道中にTOTPあり。設定で、自動コミット、ログ表示をONに。AtomのGithub連携で事足りているフシがあるので、bitbucketなしなら入れなくても良いかも。

## Web会議対策

### OBS

EMBEDLY https://obsproject.com/ja

テレカン用は、背景、「NO SIGNAL」、カメラ、各会議ソフト。音声はミキサー入れてから。Intel用エンコード設定は、未知のため要検証。

### VoiceMeeter Banana

EMBEDLY https://vb-audio.com/Voicemeeter/banana.htm

扱うデータを192kHz、24bitにする必要。あとは音量調整。