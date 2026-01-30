# mcbird-egg

## egg, the EasyGoing Generator ver. 1.5.0 for 1.21.11

[English](README.md) / [日本語](README-jp.md)

eggはデータパック研究所が提供する**データパックのためのデータパック**です。

これは「実用に耐えられるギリギリのレベルでアバウトな機能を提供する」ことを目標に開発しています。

精度や柔軟性を突き詰めればより高品質なものを作れるかもしれない。

速度や効率性を突き詰めればより高圧縮なものを作れるかもしれない。

　**だ　が　断　る　！**

うちでは突き詰めることをしません！

**egg, the EasyGoing Generator (お手軽生成器)**

の名の下に使う側も作る側も可能な限りお手軽なものを目指します。

基本的に機能のジャンルなども使えそうなら雑多に実装していく予定です。

# リファレンス

## 変数スコア

### score #var_name --

**--** はエンティティに依存しない変数用のスコアを表現します。

```mcfunction
  # 数を 10 に設定.
  scoreboard playres set #count -- 10-
  # ダメージ計算.
  scoreboard players operation #hp -- -= #damage --
  # 結果を戻り値で返す.
  return run scoreboard players get #result --

  # 実在するエンティティのスコアとして使用してはいけません..
  scoreboard players set @s -- 1234
```

## 命名規約

**(function)** は関数名を表現します。

### scoreboard

|Notation|Meaning|
|:-|:-|
|**score** #(function)\|<<**argument**|input/argument|
|**score** #(function)\|>>**result**|output/result|

スコアの衝突を避けるために関数名を接頭辞として利用する関数に関連付けます。

こうすることでスコアがどの関数で使われるかを明確にしています。

```mcfunction
  ## 例: 入力
  # 引数（入力変数）設定.
  execute store result score #xxx:heal|<<hp -- run data get entity @s Health
  scoreboard players set #xxx:heal|<<amount -- 10
  scoreboard players set #xxx:heal|<<percent -- 20
  # 関数呼び出し.
  function xxx:heal

  ## 例: 出力と入力
  # 回転情報を取得.
  function xxx:get_rotation
  # 取得した回転情報を変更.
  scoreboard players add #xxx:get_rotation|>>yaw -- 20
  scoreboard players add #xxx:get_rotation|>>pitch -- 30
  # 引数設定.
  scoreboard players operation #xxx:rotate|<<yaw -- = #xxx:get_rotation|>>yaw
  scoreboard players operation #xxx:rotate|<<pitch -- = #xxx:get_rotation|>>pitch
  # 回転処理.
  function xxx:rotate
```

### storage

|Notation|Meaning|
|:-|:-|
|**storage** (function) <<**argument**|input/argument|
|**storage** (function) >>**result**|output/result|

スコアと同様に名前空間を関数名として利用します。

```mcfunction
  ## 例: 入力＋出力 (function xxx:tan)
  # 引数設定.
  data modify storage xxx:sin_cos <<degree set from storage xxx:tan <<degree
  # sin と cos を算出.
  function xxx:sin_cos
  # 結果をスコアに取得.
  execute store result score #xxx:tan|sin run data get storage xxx:sin_cos >>sin 1000
  execute store result score #xxx:tan|cos run data get storage xxx:sin_cos >>cos 1000
  # tan を計算.
  scoreboard players operation #xxx:tan|result -- = #xxx:tan|sin --
  scoreboard players operation #xxx:tan|result -- /= #xxx:tan|cos --
  # 結果を返す.
  return run scoreboard players get #xxx:tan|result
```

## egg:3d

**ゲーム内の３次元空間に関する処理をまとめたモジュールです。**

３次元的位置関係、方向、運動量などの計算処理が行われます。

主にNBTデータタグの Pos, Motion, Rotation を参照・操作対象としています。

### `function egg:3d/motion_from_rotation`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:3d/motion_from_rotation <<rotation`|in|Rotation データ|
|`storage egg:3d/motion_from_rotation >>motion`|out|Motionデータ|
|`return`|out|処理の成否|

**Motion データから Motion データを取得します。**

Rotation データと Motion データはNBTデータタグの Rotation, Motion に相当します。

取得される Motion データは単位ベクトル（1tickでの移動量が1m）になります。

移動量の調整は function egg:nog/scale_motion を利用してください。

### `function egg:3d/rotation_from_motion`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:3d/rotation_from_motion <<motion`|in|Motion データ|
|`storage egg:3d/rotation_from_motion >>rotation`|out|Rotation データ|
|`return`|out|処理の成否|

**Motion データから Rotation データを取得します。**

Rotation データと Motion データはNBTデータタグの Rotation, Motion に相当します。

内部的に固定小数点での演算を行っているため、値によって精度に差が出ます。

高精度の結果を求める場合は他の方法を推奨します。

## egg:math

**三角関数などの数学的計算処理のモジュールです。**

このモジュールでは入出力のパラメータに ~double という接尾辞がついており、 double で入力され double で出力することを宣言しています。
ただし、内部での計算は固定小数点で行われるため、条件により精度が上下する点に留意してください。

### `function egg:math/sin_cos`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:math/sin_cos <<degree~double`|in|角度（度数法）|
|`storage egg:math/sin_cos >>sin~double`|out|Sin 値|
|`storage egg:math/sin_cos >>cos~double`|out|Cos 値|
|`return`|out|処理の成否|

**degree の角度から sin と cos の値を同時に取得します。**

処理効率の関係で sin と cos はセットで算出します。

### `function egg:math/sin_cos_tan`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:math/sin_cos_tan <<degree~double`|in|角度（度数法）|
|`storage egg:math/sin_cos_tan >>sin~double`|out|Sin 値|
|`storage egg:math/sin_cos_tan >>cos~double`|out|Cos 値|
|`storage egg:math/sin_cos_tan >>tan~double`|out|Tan 値|
|`return`|out|処理の成否|

**degree の角度から sin と cos と tan の値を同時に取得します。**

tan を直接算出するより sin/cos から算出した方が精度が高かったため、三角関数の値を全て算出する形になっています。

固定小数点で演算を行っているため、90度近くの大きな数値では精度が落ちます。

### `function egg:math/asin_acos`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:math/asin_acos <<x~double`|in|三角関数値 x (-1 <= x <= 1)|
|`storage egg:math/asin_acos >>asin~double`|out|Arcsin 値|
|`storage egg:math/asin_acos >>acos~double`|out|Arccos 値|
|`return`|out|処理の成否|

**x の値から arcsin と arccos の値を同時に取得します。**

処理効率の関係で arcsin と arccos はセットで算出します。

-1 〜 1 の範囲外の引数は、範囲内に収まるように補正されます。

厳密にチェックしたい場合は事前に確認してください。

### `function egg:math/atan2`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:math/atan2 <<x~double`|in|座標 x ~double|
|`storage egg:math/atan2 <<y~double`|in|座標 y ~double|
|`storage egg:math/atan2 >>atan~double`|out|Arctan 値 ~double|
|`return`|out|処理の成否|

**座標 x, y の値から傾きを求め arctan の値を取得します。**

固定小数点での計算のため、ほどほどの精度で十分な場合は問題ありませんが、高精度を求める場合は別の手段を検討してください。

特に固定小数点は大きすぎる数と小さすぎる数に対応できず、精度に差がでやすいです。

x, y の数値差が (10000, 0.0001) のような極端な値の場合に注意が必要です。

## egg:input

**データコンポーネント `minecraft:custom_data` 内に `{“egg”:{”type”:”device”}}` を持つアイテムを対象に右クリックを検知する機能です。**

前提として対象 `@s` はデータコンポーネント `minecraft:block_attacks` を持つアイテムを手に持っている必要があります。

実際の盾機能を不要とするならば、下記のようにアイテムへデータコンポーネントを追加してください。

```json
{
  "components": {
    "minecraft:blocks_attacks": {
      "damage_reductions": [{"base": 0,"factor": 0}]
    },
    "minecraft:custom_data": {"egg": {"type": "device"}}
  }
}
```

データコンポーネントはレシピ、ルートテーブルなどで利用可能です。

以降、このデータコンポーネントを持つアイテムは `egg:device` と表記します。

この機能は全てのプレイヤーに自動的に付与されます。

### `function egg:input/-pushed`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|入力し続けた tick 数|

**`@s` のプレイヤーが `egg:device` を右クリックしているかどうかを取得します。どちらの手も対象です。**

これは右クリックされている間は true = 「入力し続けているtick数」を返し続けます。

単発で発動させるための押下時一度きりの感知をする場合は `function egg:input/-triggered` を使ってください。

### `function egg:input/-released`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|入力し続けた tick 数|

**`@s` のプレイヤーが `egg:device` を右クリックしなくなったかどうかを取得します。どちらの手も対象です。**
これは右クリックされなくなった最初の tick だけ true = 「入力され続けていたtick数」 を返します。

### `function egg:input/-triggered`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|入力がなかった tick 数|

**`@s` のプレイヤーが `egg:device` を右クリックしているかどうかを取得します。どちらの手も対象です。**

これは右クリックされた最初の tick だけ true = 「非入力状態だったtick数」 を返します。

溜め撃ちやフルオート射撃のような押しっぱなしを感知する場合は `function egg:input/-pushed` を使ってください。

## egg:alignment

**プレイヤーを基準としたモブの関係性を表現するモジュールです。**

モブはスポーン直後の `minecraft:tick` 更新処理において適切なアライメントを egg.alignment に保持するようになります。

アライメントは以下の値を取り、中立モブの敵対や、飼いならしによって常に変化しうる点に注意が必要です。

|-1|0|1|
|:-:|:-:|:-:|
|プレイヤーと敵対|プレイヤーと中立|プレイヤーと友好|

また、あくまでプレイヤー全員を１つの味方勢力とした関係性のみの表現であり、PvP前提であるプレイヤー同士の関係や、プレイヤー側に影響のない敵対関係（スケルトンを襲う野生のオオカミなど）を表現することはありません。

### `function egg:alignment/conflict`

|Parameter|Type|Description|
|:-|:-|:-|
|`score #egg:alignment/conflict|<<this --`|in|比較対象のアライメント|
|`score #egg:alignment/conflict|<<that --`|in|比較対象のアライメント|
|`return`|out|対立しているかどうか|

**２つのアライメントが対立しているかどうかを取得します。**

### `function egg:alignment/friendly`

|Parameter|Type|Description|
|:-|:-|:-|
|`score #egg:alignment/friendly|<<this --`|in|比較対象のアラインメント|
|`score #egg:alignment/friendly|<<that --`|in|比較対象のアラインメント|
|`return`|out|友好関係かどうか|

**2つのアライメントが友好関係かどうか取得します。**

## egg:pointer

**type** : `minecraft:snowball`

**tag** : `egg.pointer`

**エンティティを参照する雪玉ポインタ機能です。**

雪玉の NBT データタグ Owner を利用して直接 `execte on origin` で参照エンティティにコマンド実行者 `@s` を切り替えることが可能です。

ポインタとなった雪玉は、衝突による破壊が発生せず不可視で無重力なエンティティになります。

不要となった場合は明示的に `/kill` コマンドで削除してください。

### `function egg:pointer/-enable`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|処理の成否.|

**`@s` の雪玉をポインタエンティティとして利用開始します。**

ポインタエンティティは `on origin` で参照先のエンティティを直接指定可能です。

## egg:shock

**ダメージとノックバックを処理するモジュールです。**

コマンド実行位置からの範囲でダメージとノックバックを発生させます。

ダメージ源となる攻撃者エンティティの存在や、攻撃対象とするエンティティの関係性（アライメント）によりいくつか関数が分かれています。

引数は多いですが、その殆どにデフォルト値が存在するため、最低限は .distance と .amoun の指定だけで機能します。引数のデフォルト値を以下に示します。

|引数|デフォルト値|
|:-|:-|
|<<.distance|省略不可|
|<<.amount|省略不可|
|<<.source|省略可|
|<<.namespace|"minecraft"|
|<<.type|"generic"|
|<<.scale|1.0|
|<<.xv|0.0|
|<<.yv|0.0|
|<<.zv|0.0|

ダメージタイプは <<.namespace と <<.type で表現され、デフォルトでは `minecraft:generic` となります。

ノックバックは効果半径内のエンティティに付与され、効果発生源から外に向かって、距離が近いほど大きくノックバックします。

さらにそのノックバックの運動量は <<.scale で乗算制御、 <<.xv, <<.yv <<.zv で加算制御できます。

扱いにもよりますが、基本的に上空への跳ね上がりはデフォルトで発生しないので、<<.yv で跳ね上がりを表現するか、効果発生源を地表ではなく若干地下に設定するなどの工夫が必要です。

### `function egg:shock/give_by_no_one`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:shock/give_by_no_one <<.distance`|in|効果範囲 (distance >= 0)|
|`storage egg:shock/give_by_no_one <<.amount`|in|ダメージ量 (amount > 0)|
|`storage egg:shock/give_by_no_one <<.namespace`|in|ダメージタイプ名前空間|
|`storage egg:shock/give_by_no_one <<.type`|in|ダメージタイプ名|
|`storage egg:shock/give_by_no_one <<.scale`|in|ノックバック乗算率 (scale > 0)|
|`storage egg:shock/give_by_no_one <<.xv`|in|ノックバック x 加算速度|
|`storage egg:shock/give_by_no_one <<.yv`|in|ノックバック y 加算速度|
|`storage egg:shock/give_by_no_one <<.zv`|in|ノックバック z 加算速度|
|`return`|out|処理の成否|

**コマンド位置を中心に半径 distance 以内の全エンティティに対してダメージとノックバック処理を行います。**

このダメージ処理には「攻撃者の害意」が存在せず、ダメージを受けたエンティティはただの災難として受け入れます。

### `function egg:shock/give_to_anyone`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:shock/give_to_anyone <<.distance`|in|効果範囲 (distance >= 0)|
|`storage egg:shock/give_to_anyone <<.amount`|in|ダメージ量 (amount > 0)|
|`storage egg:shock/give_to_anyone <<.source`|in|攻撃者エンティティ UUID|
|`storage egg:shock/give_to_anyone <<.namespace`|in|ダメージタイプ名前空間|
|`storage egg:shock/give_to_anyone <<.type`|in|ダメージタイプ名|
|`storage egg:shock/give_to_anyone <<.scale`|in|ノックバック乗算率 (scale > 0)|
|`storage egg:shock/give_to_anyone <<.xv`|in|ノックバック x 加算速度|
|`storage egg:shock/give_to_anyone <<.yv`|in|ノックバック y 加算速度|
|`storage egg:shock/give_to_anyone <<.zv`|in|ノックバック z 加算速度|
|`return`|out|処理の成否|

**distance 以内の全エンティティに対してダメージとノックバック処理を行います。**

このダメージ処理には「攻撃者の害意」が存在し、ダメージを受けたエンティティは攻撃者を敵と認識する可能性があります。

### `function egg:shock/give_to_oppositions`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:shock/give_to_oppositions <<.distance`|in|効果範囲 (distance >= 0)|
|`storage egg:shock/give_to_oppositions <<.amount`|in|ダメージ量 (amount > 0)|
|`storage egg:shock/give_to_oppositions <<.source`|in|攻撃者エンティティ UUID|
|`storage egg:shock/give_to_oppositions <<.namespace`|in|ダメージタイプ名前空間|
|`storage egg:shock/give_to_oppositions <<.type`|in|ダメージタイプ名|
|`storage egg:shock/give_to_oppositions <<.scale`|in|ノックバック乗算率 (scale > 0)|
|`storage egg:shock/give_to_oppositions <<.xv`|in|ノックバック x 加算速度|
|`storage egg:shock/give_to_oppositions <<.yv`|in|ノックバック y 加算速度|
|`storage egg:shock/give_to_oppositions <<.zv`|in|ノックバック z 加算速度|
|`return`|out|処理の成否|

**コマンド位置を中心に半径 distance 以内の攻撃者と敵対関係にあるエンティティに対してダメージとノックバック処理を行います。**

このダメージ処理には「攻撃者の害意」が存在し、ダメージを受けたエンティティは攻撃者を敵と認識する可能性があります。

### `function egg:shock/give_to_others`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:shock/give_to_others <<.distance`|in|効果範囲 (distance >= 0)|
|`storage egg:shock/give_to_others <<.amount`|in|ダメージ量 (amount > 0)|
|`storage egg:shock/give_to_others <<.source`|in|攻撃者エンティティ UUID|
|`storage egg:shock/give_to_others <<.namespace`|in|ダメージタイプ名前空間|
|`storage egg:shock/give_to_others <<.type`|in|ダメージタイプ名|
|`storage egg:shock/give_to_others <<.scale`|in|ノックバック乗算率 (scale > 0)|
|`storage egg:shock/give_to_others <<.xv`|in|ノックバック x 加算速度|
|`storage egg:shock/give_to_others <<.yv`|in|ノックバック y 加算速度|
|`storage egg:shock/give_to_others <<.zv`|in|ノックバック z 加算速度|
|`return`|out|処理の成否|

**distance 以内の攻撃者と友好関係以外のエンティティに対してダメージとノックバック処理を行います。**

このダメージ処理には「攻撃者の害意」が存在し、ダメージを受けたエンティティは攻撃者を敵と認識する可能性があります。

## egg:model

**type** : `minecraft:block_display`

**tag** : `egg.model`

**BDEngine 製のモデルを取り扱う機能です。**

BDEngine で出力されたモデル・アニメ情報が格納されたデータパックを mcbird/bde2egg.js で変換したデータが対象です。

`function #egg:bdengine/[モデル名（プロジェクト名）]` で生成されたモデルエンティティを操作できます。

### `function egg:model/-enable`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|処理の成否|

**`egg.model` 機能を有効化します。**

対象 `@s` のブロック表示エンティティが `egg.model` として有効化され
`function egg:model/-xxx` の全ての機能が利用可能になります。

### `function egg:model/-delete`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|処理の成否|

**`egg.model` エンティティを削除します。**

`egg.model` は複数のパーツエンティティで構成されているため
単体の `/kill` では完全に削除できません。

必ずこの関数で削除してください。

### `function egg:model/-rotate`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|処理の成否|

**`egg.model` エンティティを回転します。**

`egg.model` は複数のパーツエンティティで構成されているため
単体の `/rotate` では正常に回転できません。

必ずこの関数で回転してください。

### `function egg:model/-set_pose`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:model/-set_pose <<pose`|in|ポーズデータ|
|`return`|out|処理の成否|

**`egg.model` エンティティにポーズを設定します。**

BDEngine のアニメーション機能で生成されたデータを
mcbird/bde2egg.js で egg データパック用に変換したデータが対象です。

### `function egg:model/-transform_with_interpolation`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|処理の成否|

**`egg.model` エンティティに線形補間を与えます。**

BDEngine のアニメーション機能に準拠した線形補間が適用されます。

### `function egg:model/-transform_without_interpolation`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|処理の成否|

**`egg.model` エンティティに線形補間を与えないようにします。**

初期ポーズ設定時用に線形補間せず即時にポーズを反映させるように指定します。

## egg:animatioin

**type** : minecraft:block_display

**tag** : `egg:animation`

**BDEngine 製のアニメーションを取り扱う機能です。**

BDEngine で出力されたモデル・アニメ情報が格納されたデータパックを mcbird/bde2egg.js で変換したデータが対象です。

`function #egg:bdengine/[モデル名（プロジェクト名）]` で生成されたモデルエンティティを操作できます。

### `function egg:animation/-enable`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|処理の成否|

**`egg:animation` 機能を有効化します。**

対象 `@s` のブロック表示エンティティが `egg:animation` として有効化され
`function egg:animation/-xxx` の全ての機能が利用可能になります。

### `function egg:animation/-finished`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|再生終了したかどうか|
**アニメーションの再生が終了したかどうかを取得します。**
リピート回数が -1 (無限ループ) 以外に設定された対象 `@s` のアニメーションが再生終了したかどうかを確認します。
`function egg:animation/-play`, `function egg:animation/-stop`, `function egg:animation/-pause` などの制御による再生中かどうかは
`egg:animation.playing` タグを持っているかどうかで判断してください。

### `function egg:animation/-pause`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|処理の成否|

**`egg:animation` を一時停止します。**

対象 `@s` のアニメーションを一時停止します。

`function egg:animation/-play` で再生を再開できます。

### `function egg:animation/-play`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|処理の成否|

**`egg:animation` を再生します。**

対象 `@s` のアニメーションを再生します。

### `function egg:animation/-set`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:animation/-set <<.repeat`|in|リピート回数 (-1:無限ループ)|
|`storage egg:animation/-set <<.path`|in|アニメデータのパス名|
|`return`|out|処理の成否|

**`egg:animation` にアニメデータを設定します。**

対象 `@s` にアニメデータを設定します。

BDEngine のアニメーション機能で生成されたデータを
mcbird/bde2egg.js で egg 用に変換したデータが対象です。

BDEngine 上で設定したモデル名（プロジェクト名）とアニメデータ名から
パス名は [モデル名]-[アニメデータ名] とハイフンで接続された文字列になります。

### `function egg:animation/-stop`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|処理の成否|

**`egg:animation` を停止します。**

対象 `@s` のアニメーションを停止します。

## egg:pack

**特定のデータ構造でを持つ NBT データタグを対象にしたモジュールです。**

以下の 2 つの方法で設定された `egg:pack` パッケージが対象になります。

**[名前指定]**

```mcfunction
data modify storage <namespace> <path> set value {name:"xxx:aaa/bbb/ccc",data:{...}}
data modify entity @s data.<path> set value {name:"xxx:aaa/bbb/ccc",data:{...}}
```

**[別名指定]**

```mcfunction
data modify storage <namespace> <path> set value {namespace:xxx,alias:aaa_bbb_ccc,data:{...}}
data modify entity @s data.<path> set value {namespace:xxx,alias:aaa_bbb_ccc,data:{...}}
```

これは関数タグ `function #xxx:alias/aaa_bbb_ccc` が定義されていることが前提になります。

```json
{
"replace": true,
"values": ["xxx:aaa/bbb/ccc"]
}
```

名前指定は 7 階層までしか指定できません。

data:{...} は汎用情報で `function egg:pack/call` で呼び出される時に `storage egg:pack/call <<` に設定されます。

これにより状態と手続きをセットでデータとして管理することが可能になります。
NBT データタグであればどこにでも保存でき、以下のようにして実行が可能です。

```mcfunction
data modify storage egg:pack/call <<pack set from entity @s data.<path>
function egg:pack/call

data modify storage egg:pack/call <<pack set from storage <namespace>.<path>
function egg:pack/call
```

### `function egg:pack/call`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:pack/call <<pack`|in|`egg:pack` パッケージ|
|`return`|out|処理の成否|

**`egg:pack` パッケージを実行します。**

`storage egg:pack/call <<` に `data` の汎用情報を格納した状態で `egg:pack` パッケージに登録された関数を呼び出します。

### `function egg:pack/preload`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:pack/preload <<name`|in|関数名|
|`return`|out|処理の成否|

**関数名を事前登録します。**

`egg:pack` パッケージは別名指定を使わない場合、解析に多くの処理を必要とし、初回の動作が重くなりやすいです。

この関数で事前登録しておけばバックグラウンドで解析処理を行います。

## egg:nog

**egg データパックをより簡単に扱うためのユーティリティです。**

egg データパックの仕様は独特なので、より一般的に取り扱える形式に簡略化したインターフェースと便利で雑多な簡単な関数をまとめています。

### `function egg:nog/macro/new_animation`

|Parameter|Type|Description|
|:-|:-|:-|
|`with repeat`|in|リピート回数 (-1:無限ループ)|
|`with model`|in|モデル名|
|`with anime`|in|アニメーション名|
|`return`|out|処理の成否|

**モデルを生成しアニメーションを再生します。**

生成されたモデルには `__uninitialized` タグが設定されているので初期化時に利用してください。

初期化終了後は必ず `__uninitialized` タグを削除する必要があります。

### `function egg:nog/macro/new_model`

|Parameter|Type|Description|
|:-|:-|:-|
|`with model`|in|モデル名|
|`return`|out|処理の成否|

**モデルを生成します。**

生成されたモデルには `__uninitialized` タグが設定されているので初期化時に利用してください。
初期化終了後は必ず `__uninitialized` タグを削除する必要があります。

### `function egg:nog/macro/play_animation`

|Parameter|Type|Description|
|:-|:-|:-|
|`with repeat`|in|リピート回数 (-1:無限ループ)|
|`with model`|in|モデル名|
|`with anime`|in|アニメーション名|
|`return`|out|処理の成否|

**アニメーションを再生します。**

対象 `@s` のモデルをアニメーション再生します。

### `function egg:nog/compare_uuid`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:nog/compare_uuid <<this`|in|比較対象の UUID|
|`storage egg:nog/compare_uuid <<that`|in|比較対象の UUID|
|`return`|out|2つの UUID が等しいかどうか|

**2つの UUID が等しいかどうかを比較します。**

### `function egg:nog/match_uuid`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:nog/match_uuid <<target`|in|比較対象の UUID|
|`return`|out|UUID が一致したかどうか|

**対象の UUID を `@s` の UUID と比較します。**

### `function egg:nog/origin`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|`on origin` を持っているかどうか|

**`on origin` を持っているかどうかを取得します。**

### `function egg:nog/passengers`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|`on passengers` の数|

**`on passengers` の数を取得します。**

### `function egg:nog/scale_motion`

|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:nog/scale_motion <<motion`|in|Motion データ|
|`storage egg:nog/scale_motion <<scale`|in|倍率|
|`storage egg:nog/scale_motion >>motion`|out|倍率適用後の Motion データ|
|`return`|out|処理の成否|

**Motion データを scale 倍します。**

Motion データはNBTデータタグの Motion に相当します。

### `function egg:nog/target`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|`on target` を持っているかどうか|

**`on target` を持っているかどうかを取得します。**

### `function egg:nog/vehicle`

|Parameter|Type|Description|
|:-|:-|:-|
|`return`|out|`on vehicle` を持っているかどうか|

**`on vehicle` を持っているかどうかを取得します。**

### `function egg:nog/ride`
|Parameter|Type|Description|
|:-|:-|:-|
|`storage egg:nog/ride <<uuid`|in|`@s` に騎乗させるエンティティの UUID|
|`return`|out|処理の成否|
**`<<uuid` のエンティティを `@s` に騎乗させます。**
