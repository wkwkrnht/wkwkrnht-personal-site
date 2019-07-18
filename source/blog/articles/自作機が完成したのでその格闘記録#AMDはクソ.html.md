---
title: '自作機が完成したのでその格闘記録#AMDはクソ'
date: 2019-04-06T17:20:47+09:00
author: wkwkrnht
tags:
  - ADATA
  - Amazon
  - AMD
  - Asrock
  - docomo
  - dポイント
  - ENERMAX
  - PC
  - Rainbow Six Siege
  - Windows
  - ゲーム
  - セール
  - ドスパラ
  - パソコン工房
  - 不具合
  - 玄人志向
  - 自作PC
---
EMBEDLY http://wkwkrnht.wp.xdomain.jp/windows/2535

予告通り、組みました。構成は、以下に載せます。ちょっとばかし追加したパーツもあるので。OSは公開していませんでしたが、結局Windows Server 2016 Standardになりました。これが最悪の結末を招くのですがそれはおいおい、というわけで進んでいきましょう。

## 構成

| 種類 | 商品名 | 金額 |
| CPU | [Ryzen3 2200G](https://www.dospara.co.jp/5shopping/detail_parts.php?bg=1&br=10&sbr=1299&ic=451545&ft=Ryzen3+2200G&lf=2) | 13,608-13,608=0 |
| GPU | 例のグラボ | 7,106 |
| RAM | [AD4U266638G19-D](https://www.dospara.co.jp/5shopping/detail_parts.php?bg=1&br=12&sbr=1017&ic=457266&ft=AD4U266638G19-D&lf=2) | 9,980 |
| マザーボード | [B450 Pro4](https://www.dospara.co.jp/5shopping/detail_parts.php?bg=1&br=21&sbr=1297&ic=453935&ft=B450+Pro4&lf=2) | 8,769 |
| SSD | [ASU650SS-240GT-X](https://www.dospara.co.jp/5shopping/detail_parts.php?bg=1&br=115&sbr=1155&ic=456872&ft=ASU650SS-240GT-R&lf=2) | 4,980 |
| 電源 | [KRPW-AK650W/88+](https://www.dospara.co.jp/5shopping/detail_parts.php?bg=1&br=83&sbr=83&ic=440389&ft=KRPW-AK650W%2F88%2B&lf=0) | 6,066 |
| ケース | [ECA3360B-BT](https://www.dospara.co.jp/5shopping/detail_parts.php?bg=1&br=72&sbr=79&ic=385119&lf=2) | 2,700 |
| OS | [Windows Server 2016 Standard](https://product.rakuten.co.jp/product/-/66b067a37af8cff0823de06625c57926/?scid=s_kwa_pla_pcp) | |
| 小計 | | 39,601 |
| HDD | [WD40EZRZ-RT2](https://www.dospara.co.jp/5shopping/detail_parts.php?bg=1&br=13&sbr=172&ic=442588&_bdadid=JPGTE5.00002isv&lf=0) | 5,780 |
| ケースファン | [CFY-120S](https://shop.tsukumo.co.jp/goods/4937925913060) | 663*2-1242=84 |
| カードリーダー | [KKmoon 5.25インチ内蔵カードリーダー メディア 多機能 ダッシュボード PCフロントパネル USB 3.0 サポートCF XD MS M2 TF](https://www.amazon.co.jp/gp/product/B071FH8KQR/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1) | 1,599 |
| アダプタ | [変換名人 M/B上のUSB3.0ピンヘッダ端子 → USB3.0(A・メス×2)変換アダプタ MB-USB3](https://www.amazon.co.jp/gp/product/B00EIEZ5PO/ref=ppx_yo_dt_b_asin_title_o07_s00?ie=UTF8&psc=1) | 682 |
| アダプタ | [SIENOC USB2.0ピンヘッダ端子(9ピン) USB3.0ピンヘッダ端子(20ピン)変換ケーブル (2個)](https://www.amazon.co.jp/gp/product/B01985OE2C/ref=ppx_yo_dt_b_asin_title_o09_s00?ie=UTF8&psc=1) | 550-16=534 |
| ケーブル | [SATA ケーブル 6本セット 高速 6Gbps SATA3 ケーブル シリアルATA3 抜け防止 ラッチ付き SATA III cable ストレート](https://www.amazon.co.jp/gp/product/B074MZRWDK/ref=ppx_yo_dt_b_asin_title_o08_s00?ie=UTF8&psc=1) | 679 |
| SSD | [WESTERN DIGITAL WD Blue 3D NAND SSD 500GB SATA M.2 2280 WDS500G2B0B](https://www.dospara.co.jp/5shopping/detail_parts.php?bg=1&br=115&sbr=1144&ic=448487&ft=WESTERN+DIGITAL+WD+Blue+3D+NAND+SSD+500GB+SATA+M.2+2280+WDS500G2B0B&lf=1) | 8096-2134=5962 |
| 光学ドライブ | [ASUS Windows10対応 高性能型内蔵ブルーレイコンボドライブ BC-12D2HT](https://www.amazon.co.jp/gp/product/B01JP7BW0U/ref=ppx_yo_dt_b_asin_title_o05_s00?ie=UTF8&psc=1) | 5,805 |
| USBハブ | [PCケース内部用USB HUB INTERNALUSBHUB ブラック](https://shop.tsukumo.co.jp/goods/4943508300691) | 2,311-192=2,119 |
| 追加計 | | 23,244 |
| 総計 | | 62,845 |

こんな感じです。当初の予定より基礎分は安くはなったのですが、アップデートパーツがかさんでしまいました。とはいっても、APU無料とここには載せていないポイント還元などがあるので相殺どころの騒ぎではないのですが。いずれにせよ、ロードマップ上のものが早まっただけなんですけどね。実際に組んだ感触としては、配線用のスペースが足りないことと、プラグイン電源ではないことの汚点がはっきりしたことですね。夏を考えると、クーリング上の利点がある裏配線はできる限り行いたいわけです。そこで、全部の線を通したところ蓋が閉まらないという事態に、SATA電源や4ピン電源なんかは使っていないですが、安い電源なのでプラグインじゃないんです。そのせいで、大分汚くなってしまいこの組み合わせは邪悪だなぁと感じました。なので、プラグインかつ80PLUS Gold以上の良質電源に載せ替えようかと思います。これ以上の性能向上には、「普通」のGPUが必要なのでそのためにも電源載せ替えは必要ですね。Zen2にしたいのですけれど、そのためには、総計分もう一回の支払いが必要なので、躊躇しているところです。夏のボーナスよ来い。

NOTICE あとは、マザーボード上の制約によりUSBヘッダーピンソケット不足になっているので、NZXTのINTERNAL USB HUBが届き次第フルパワーになりますね。夏が来る前には、簡易水冷化したいという野望もあるので、追加で10k弱ぐらいですかね。そこまでやれば、BD再生ができないことを除けば、機能はそろい、安定性も爆上げなので十分でしょう。それ以上は、Ryzen5+RX580なので30k強はいくでしょうね。ちょっと時間がかかりそうです。(2019/4/6時点)

## Windows Serverという「クセ」

EMBEDLY https://qiita.com/wkwkrnht/items/edfea62be59955ae8cef

このOSは一般向けではないです。エンタープライズのホストやホームサーバーでGUIを求める人に使われます。一昔前にはWHS2011が廉価Windows7として持て囃されたこともあり、なんとかクライアントとして動かせなくもない、むしろUWP化によって易化しているだろうという観測でした。でした。さすがはM$です。そういった甘い妄言はぶち壊してくれます。いくつかは、Qiitaのほうに書いたのでそちらを参照してほしいのですが、これはAMDの怠慢といえます。おそらくPro版も影響を受けているので、そう考えると素直に馬鹿じゃない？としか言えないんですよね。公式フォーラムに事象がレイズされているので、声明なりなんなり出しといて、問題点説明すればいいのにそれすらしないのはさすがに擁護しようないです。Photon2も買ってちゃんとAMDでそろえて組んだのに、この仕打ちですよ。だからB2BでIntelに勝てないのは当たり前ですよ。正直この一点は予想もしていませんでした。確かにエンタープライズ向けのSKUではないのですが、制限はかかっていないだろうと踏んでいたので。そうすると、CPUとGPU架装をする前に、ちゃんとWindows10のライセンス買わないとなぁとかそういう感じになってしまいます。

もちろん、それだけじゃないですよ？まず、UWPを作った意味が不明なことです。Microsoft Storeはインストールできず、個人アカウントでは実行パッケージもダウンロードできないので、ないのと同じです。せっかくTweeten、Spotify諸々をセットアップしようと思ったのに残念です。つまりはForzaも実行できないんですね。売りたくないんだろうなぁ。いや、ターゲットから外れているんでしょうけど、管理者権限で再インストールするぐらいはできてもいいでしょうと。いつまで、Windows Media Player使わすねんと思わず言いたくもなります。さらに輪にかけてひどいのが、リモートデスクトップサービスをインストールすると、個人契約のOfficeがライセンスを満たさなくなることです。エラーメッセージにはターミナルサービスと書いているので、気づきにくいでしょう。はてなに関連記事があったので気づけましたが。要件ページにでもわかりやすく書いてほしいというのが本音です。注釈は対応を見なければいけないので、見づらいので嫌いなんですよね。インテントつけて直後に書くでもいいじゃないというのが本音です。焦ってTunderbirdを入れてしまったので、移行作業があります。Officeはインストール対象がコントロールできれば尚いいんですけどね。誰が私用でOutlookとWindows10付属メーラー重複させんねんと。どちらかはアンインストールしたいです。これは、UH75/B3の愚痴です。まあ、こんな感じでR6Sの動作確認をしたくらいで、あまり満足いくソフトウェア環境ではないというのが本音です。GPUの割り当てができていないですし。

## まとめ

安さにこだわりすぎましたね。ハードの方はまだ我慢できます。というか、電源は消耗品なので時機を見て交換しますし。問題はソフトウェアです。こんなに使えないもんだと思いませんでした。AMDerは気づかないですよねぇこんなところ。商用環境でバシバシ使われるほどの普及率ではないことが、傷になっています。時間が解決してくれることを望んで待っています。たぶん、次こいつが出てくるのが、ストレージ増設かメインスペックの刷新でしょう。その時をお楽しみにー。もしかしたら、R6Sもレポートするかもです。