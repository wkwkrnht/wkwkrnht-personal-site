---
title: 【悲報】APEX民さんパッチノート読まずに運営批判を始めてしまう
date: 2023-06-18T08:28:30.381Z
author: wkwkrnht
tags:
  - FPS
  - APEX
  - ゲーム
  - ランク
---

APEX LEGENDSもS17に突入して、もはや折返しに向かおうとしています。そんなさなか、S17に投入されたBRのランクシステムアップデートを理解しないまま、「ﾊﾞｸﾞﾀﾞｰ」と運営批判をしている層が確認されました。実際、俺が原理的におかしくないだろうと言ったら、顔真っ赤に絡んでくるだけなんですけどね。ゲームのルールすら理解しない層に批判される運営に同情する次第です。そういうわけなので、新ランクシステムの状況を一回まとめてみようかなと思います。なので、以下の主語は、基本的に開発者あるいはゲームシステムとなります。

EMBEDLY https://www.ea.com/ja-jp/games/apex-legends/news/arsenal-ranked-2023-update

EMBEDLY https://www.ea.com/ja-jp/games/apex-legends/news/matchmaking-2023

## ランクの評価指標

今までプレイヤーはBRのランクリーグにおいてRPのみで表現されていましたが、MMRとLPという2つに分裂しました。MMRがプレイヤーの行動を評価した結果、LPがランク報酬を得るために要求される値となります。つまり、実際の人間からする評価はMMRを基準に行うことが正しいとなります。これはMMRの役割がマッチングレートに定められていることからも理解できるはずです。あくまでもLPは、順位を基準に計算されるランクディビジョン分け基準です。

### MMRの算出基準

まず、プレイヤーを真に評価しているMMRの算出基準はどこなのでしょうか。計算式は非公開とされています。最も重みが強いところが明言されれば、そこを強化するチートが有利になるので、妥当な処置と言えるでしょう。ただし開発ブログによれば、順位の高低、エリミネーション、連勝、連敗がMMRを変化させる要因として例示されています。RPが順位とエリミネーションによって計算されていたことから、納得感は強いでしょう。連勝ないしは連敗については、結果としてMMRの増減を助けるものとして紹介されており、それ自体が直接的な要因となることは考えられていないようです。

### LPの算出基準

MMRに対して、LPについては査定基準が明確になっているところがあります。順位により査定される基礎部分と、様々な要因に基づいて計算されるボーナス部分に分かれると明言されています。基礎部分については、次の表のようになっています。

| 順位 | 20～14 | 13～11 | 10 | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 |
| LP | -35 | -25 | 20 | 25 | 40 | 60 | 80 | 100 | 125 | 150 | 175 | 200 |

APEX LEGENDS運営としては、試合の上位半分に入ることが勝利条件という認識を明言しています。これは、撃破よりも生存こそがバトルロワイヤルにおける目標という哲学に基づいています。よって、ランクディビジョンに関わらず、チャンピオンつまりは最終生存者をプレイヤーが目指すようにシステムを構築したようです。また、このポイントはボーナスの計算によらず独立して配分されます。

次に、ボーナス部分について説明します。ボーナスと呼ばれるように確実に受け取れるものではなく、一定のアルゴリズムに基づいて0から計算されるものになります。アルゴリズム自体は、キルファーミングなどの不正行為を抑止する目的で非公開となります。ただし、獲得期待値を変化させる要因として、マッチ難易度、プリメイドのパーティに居る人数、順位、達成したチャレンジが例示されています。あくまでも期待値なので、LPを確実に加点する要素ではないことに注意しなければいけません。順位については、高順位であるほど「ボーナスの幅」が拡大するなど、直接的な関係性が明言されているため重要であると考えられます。

ここで、マッチ難易度という概念が新しく提示されます。詳しくはマッチングアルゴリズムの項となりますが、プレイヤーのMMR、プリメイドのパーティに居る人数、マッチング開始時のプールが表すMMR分布が算定根拠と考えられます。そのため、LPを基に表示されるランクディビジョンで判断することはできません。

ボーナスを3つのグループに分けて詳細な説明を行っていきます。このグループ分けは、達成するべきチャレンジを理解するのに役立つはずです。

#### エリミネーションボーナス

自パーティが他のプレイヤーを撃破した場合付与されます。同一のプレイヤーを複数回撃破した場合、重複して計算されることはありません。また、プレイヤー個人のキル数、アシスト数、参加数が算出根拠として個別に調整されると明言されています。しかし、具体的な点数配分は開示されず、個別の試合における計算結果のみ公開されることに注意してください。

アシスト数はプレイヤーが所定の攻撃をしてから30s以内に味方がダウン獲得またはキルをした数、プレイヤーがダウン獲得した敵が蘇生され30s以内に味方が再びダウン状態にした数、2つの数の合計で表されます。参加数は、味方がプレイヤーの協力を得ずにダウン獲得やキルをした数です。

#### レートボーナス

MMRがLPを上回ったときに、システムが合理的に判断した本来のランクディビジョンへ調整するために付与されます。

#### スキルボーナス

MMRの均衡が取れていないマッチで、自パーティが際立ったパフォーマンスを見せた場合に付与されます。自パーティより強いチームと交戦した場合も付与されます。

## ランクリーグのタイムライン

ランクシーズンが始まったときから、ランクディビジョンがどのように推移するか考えてみましょう。この制度では、前シーズンからLPがキャリーオーバーすることはなくなりました。以前なら、前スプリットのランクからスタート位置を計算できましたが、それが不可能になったということです。

そのため、プレイヤー全員がルーキー4からスタートすることになります。また、ランクシーズン開始から10戦は、LPをMMRとすり合わせるためのプレースメントマッチとなります。そのため、レートボーナスに当たる部分が増幅され、素早くランクディビジョンが上昇します。また、このときの損失が0になっている可能性があります（公式文書では明言されているが、このようなときに遭遇したことがないので未検証）。

その他に、ランクディビジョンの仕切りも整理されました。各ディビジョン1000LPとなったので、以前のように上位ランクディビジョンでボーナスを意識する必要はなくなりました。これにあわせて昇格ボーナスを250LP（以前は300RP）、降格ペナルティを-150LP（以前は1ディビジョンのRPの半分）へ変更されました。また、ルーキーには降格しないという規律がありましたが撤廃されました。

## マッチングアルゴリズム

S17開始より前に、マッチングアルゴリズムのアップデートがあり、詳しい解説も公開されていました。まだMMRという概念が未公表だったため濁されていた部分もあったのですが、スキルレートという言葉を使って実際のデータを示しながらアルゴリズムの目的について説明されています。

スキルレートとXPの獲得量を表すレベルの箱ひげ図を見ると、高スキル帯に多くの外れ値が存在しており、レベルに対してスキルレートの中央値が示すゆるい相関を無視できる程度と確認できます。よって、レベルによらず、スキルレートを測定する必要があります。スキルレートは、プレイヤー全体でどのような分布をとることが理想なのか、改めて検討する必要があります。1つ大きな分岐点は、スキルレートがある基準点に対する絶対量として扱えるかどうかです。たとえば、1より2が、1.1より1.2が高スキルと断言できるかどうかです。断言できる場合、元いい点で確認されている連続的なガウス分布は、プレイヤー全体の特徴をよく表しているといえます。反対にそうでない場合は、バケットと呼ばれる一種の幅をもったグループにプールし、相対的に評価する必要があります。旧来のシステムでは、低スキルプレイヤーが高スキルプレイヤーからゲームの仕組みを学ぶ時間を確保するために、後者のシステムを採用していました。

スキルレートと勝率について、新システムに基づくマッチングを行い検証した結果が棒グラフとして示されています。0を基準としたとき勝率50%となり、正の相関を持つことが確認できます。ここから新システムのスキルレートは、プレイヤーのスキルレートを絶対評価できていると考えられ、ガウス分布を用いた評価が可能になります。

ここまで、プレイヤー個人のスキルレートと、スキルレートで表したプレイヤー全体の分布を記述しました。実際のマッチングでは、パーティを作成する、パーティを集めて試合人数を満たすという手順が必要になります。はじめに、パーティを作成するときの考え方を説明します。各パーティがもつスキルレートの総和が等しくなるならば、あるパーティに最もスキルフルな人と最も低スキルな人がマッチングすることになります。ランクリーグにおいては、公平性よりも競争的な環境を重視するため、似通ったスキルレートを持つプレイヤーたちを同じパーティにマッチングします。また、プリメイドのパーティに居る人数を考慮する必要があります。ソロプレイヤーにとっては、デュオパーティ、あるいはソロ2人とマッチングする可能性があります。

次に、パーティを揃え試合人数を満たすフェーズを説明します。旧来のシステムは、プリメイドのパーティに居る人数を揃えるようにマッチングされます。残念ながらマッチングタイミングではプリメイドのパーティに居る人数が揃わないこともあります。この可能性を対処するために、プリメイドを含む場合は最初からMMRを大きく見積もるように設計されています。この増加分はプリメイドによるコミュニケーションや順応への優位性を表し、プリメイドのパーティに居る人数に応じて変化します。現在はこの補正が適正かどうか検討しています。

マッチングアルゴリズムを評価するときに、公平性とともに試合開始までの時間も考える必要があります。公平性と待ち時間のバランスを取りながら現実的な選択をしなければいけません。旧来のシステムでは、バケットによる静的なマッチングでした。新システムでは、現在このサーバーに存在するプレイヤーの分布を予測し、さらに評価を行うような形式をとります。待ち時間の短縮につながることが実際に確認されています。

### マッチング難易度について

NOTICE この言葉について記事内で細かに説明していないため、多分に憶測が入ることを認識した上で、次の文章を読み勧めてください。

ボーナスを算定する際に、マッチング難易度が重要となります。マッチングアルゴリズムの説明で明言されているように、その時間帯、そのサーバにおけるMMR（スキルレートはMMRのコードネームのようなものと考えて差し支えないと思っています）の相対評価によりマッチングプールが決定されます。また、自パーティがほかのパーティに対して、どれだけMMRの優劣を持つかが難易度の算出根拠となることは想像に難くないです。また、プリメイドのパーティに居る人数によって、本来のMMRより過大に評価されることが明らかになっています。しかし、LPは実際のMMRに基づき調整されるため、そこに一定の剥離があると考えられます。競争力のあるパーティであれば、この剥離は怒らないということも確認されているはずです。これらのことから、MMR補正後の自パーティが、試合内におけるMMR分布で予想勝率50%以下の場合にボーナスの期待値が上昇すると考えています。しかし、MMR、マッチング基準、ボーナス計算式が非公開である以上、内部情報を入手せずに詳細な検討は不可能です。

## さいごに

2つの記事をまとめたので、少し長くなっています。また、要約するために意図的に情報量を削減している部分もあります。それでも、今回のアップデートについて重要な部分を表現していると考えています。公式サイトの開発ブログのみを参照しているため、ほかにも情報があればアップデートしたいところです。

このエッセンスを確認すると、プリメイドパーティを考えなしに組むこと、キルを追い求めることの2点は悪手と言えます。現在のシステムでボーナスが0以上となっているため、順位点が減ることがあありません。よって、ハイドや安置外耐久など手段を問わずに順位上昇を図ることがLP計算上は最適解となります。これはLPについてのルールが、現時点でこうなっているということに過ぎません。S18以降のルールで対策される可能性も考慮する必要があります。また、プレイヤーが予期していたものと最終的なボーナスが異なる場合については、プレイヤーは開発者ではないため、バグと断定することはできません。あくまでもバグは、作成者の想定と違う挙動かつ何かしらの不都合が存在する場合を指しているので、断定するためには両方の条件を満たす必要があります。そのうえ、先程のような順位だけを重視する戦略と、チートやブースティングのような不正行為を識別子、正しくボーナスを計算する必要があるため、類似した戦績にボーナスが配分されないことが正常であると考えられます。もちろん、このブログの執筆者も制作者ではないので、一生涯バグにはならないと断言できあませんが、あくまでも現時点（2023/06/18）でバグと断言するだけの材料がないことは確かです。
