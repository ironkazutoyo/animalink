# アプリ名
### Animalink
<br>

# 概要
## アプリ名の由来
animal(動物)+link(繋がる)<br>
動物で誰かと繋がり、動物と繋がれるアプリを目指しました。
<br>
<br>

## 機能一覧
- マイページ機能
  - よくあるマイページに、飼っているペット情報を登録する機能を搭載しています。
- 記事投稿機能
  - 写真や文章を投稿できます。
- カレンダー機能
  - カレンダーに【予定】【記録】と、2種類の情報を保存できます。
  - カレンダーにて情報を保存する際、通知のON・OFFを設定できます。
    通知ONの内容はトップページに表示され、トップページにて通知の終了ができます。
- 記事のお気に入り機能(未実装)
- フォロー機能(未実装)
- 記事へのコメント機能(未実装)
- 記事へのいいね機能(未実装)
- 検索機能(未実装)
<br>
<br>

# 制作背景
## 現状
- ペットの様々な記録を残していきたい
- 記録をよくつけ忘れてしまう
- 定期的にしないといけないことの、前回の実施日を覚えていない
## 課題
- 既存のアプリだと、用途別に複数のアプリを使わなければいけない
  - 結果、どれかのアプリが疎かになる為、記録のつけ忘れ等が起こってしまう
- 記録をつけておくだけのアプリは、そのためだけに使うことになる
  - アプリを開く機会が少なくなり、いざ記録をつけるときに忘れてしまう
- ペットを飼っていると、週一回や月一回しないといけないことがあるが、期間が長くなればなるほど、前回がいつだったかを覚えていられない
  - 気がついたら1週間のはずが2週間経っていたりする
## 解決策
### ひとつのアプリで完結させる
- 普段から使うアプリとして1つが存在すれば、何か1つが疎かになることはない
- 誰かとコミュニケーションが取れたり、日記や備忘録の投稿ができれば、アプリを開く機会が増える
- 予定や記録をカレンダーに保存しておき、必要なものだけアプリのトップページに通知が出てくれば、しないといけない事を忘れにくくなる
<br>
<br>

# DEMO
## マイページ
- トップページの上部右側or左メニューバーの上部にある、ユーザー名をクリックすると、マイページへ遷移する。
![マイページ遷移](https://user-images.githubusercontent.com/78397291/112472622-b5df4180-8db0-11eb-8a75-0c8e1547655e.gif)
- マイページの編集では、新規登録時のパスワード以外の情報に加え、ペットの有無と自己紹介記載ができる。(必須ではない)
![マイページ編集](https://user-images.githubusercontent.com/78397291/112472629-b7106e80-8db0-11eb-9208-dde8eeebde1d.gif)
- 自分の飼っているペットの一覧を登録し、マイページ下部にリストアップでき、同項目内から追加が行える。
![ペット一覧表示→追加](https://user-images.githubusercontent.com/78397291/112472640-baa3f580-8db0-11eb-86f0-384d8ad2942b.gif)
- それぞれのペット情報に誕生日を登録すれば、詳細ページで年齢が年・月・日で自動表示される
![年齢の自動表示](https://user-images.githubusercontent.com/78397291/112470617-351f4600-8dae-11eb-9a41-53e335479245.gif)
<br>

## 記事投稿・表示
- 記事作成・編集時、投稿記事の公開・非公開の設定が可能。公開にしたものは、トップページの一覧表示画面に、新着が上になるよう表示される
![公開の場合](https://user-images.githubusercontent.com/78397291/112472556-a19b4480-8db0-11eb-8df7-575fdc714722.gif)
![非公開の場合](https://user-images.githubusercontent.com/78397291/112470620-35b7dc80-8dae-11eb-8beb-8405b667d323.gif)

## カレンダー機能
- 予定や記録を追加すると、予定は緑・記録は青で色分けされ、それぞれの日に表示される
![カレンダーの表示](https://user-images.githubusercontent.com/78397291/112472578-a6f88f00-8db0-11eb-8606-a8505a699c98.gif)
- それぞれの予定や記録をクリックすると詳細が確認でき、編集ページへの遷移ボタンや削除ボタン存在する。
![予定や記録の詳細画面](https://user-images.githubusercontent.com/78397291/112472602-ae1f9d00-8db0-11eb-885a-eb8160a1e811.gif)
- カレンダーの予定・記録の追加や編集では、追加する内容の種類と通知の有無を設定でき、通知ありにしているとトップページ上部に表示される
![通知有](https://user-images.githubusercontent.com/78397291/112470612-33558280-8dae-11eb-9f97-eb0b2ea41fe3.gif)
![通知無](https://user-images.githubusercontent.com/78397291/112470624-3781a000-8dae-11eb-98d9-d986b73f82ba.gif)
- 通知の表示のされ方
  - 予定日は【〜の予定まで〜日です】、記録日は【〜の記録から〜日経過です】と表示され、それぞれ違う色のアンダーラインが入る。予定が上、記録が下にまとまって表示される。
  ![通知の表示](https://user-images.githubusercontent.com/78397291/112470586-2f296500-8dae-11eb-9bd3-6d3754411835.gif)
  - 予定日が過ぎている場合、自動的に記録日に切り替わる。
  ![種類の自動変更](https://user-images.githubusercontent.com/78397291/112470565-29cc1a80-8dae-11eb-8d81-a5021b768af5.gif)
  - それぞれの通知の右側にある通知終了をクリックすると、その予定や通知の通知設定はOFFになる
  ![通知の終了](https://user-images.githubusercontent.com/78397291/112470595-305a9200-8dae-11eb-972c-2462a482d9d3.gif)
<br>
<br>


# 実装予定の内容
- 記事のお気に入り機能(未実装)
  - 投稿記事をお気に入り登録し、トップページで一覧表示できる機能
    - 別途、お気に入り投稿一覧専用のページも設置予定
- フォロー機能(未実装)
  - ユーザー同士のフォロー機能
    - 様々なユーザーをフォローし、フォローやフォロワーの詳細ページや投稿の閲覧ができるようにする予定
- 投稿へのコメント機能(未実装)
  - 投稿記事へコメントをする機能
    - よりコミュニケーションを図れるようになるため、実装予定。コメントしているユーザーの詳細ページへのリンクも検討。
- 投稿へのいいね機能(未実装)
  - 投稿記事にいいねする機能。
    - いいねが多い記事は、トップページで一覧表示させる予定
- 検索機能(未実装)
  - ユーザーが特定のペット種や投稿ジャンルで、投稿記事検索をできる機能。
    - ユーザーそれぞれが興味のある特定の記事を見れた方が便利な為、実装予定。
<br>
<br>

# 改善点
### コードの可読性
- 【課題】ビューファイルは使い回しが多い為、taskのビューファイルのところにarticle-formなどのクラスが存在する
  - 【改善策】あらかじめ使い回すであろう場所は部分テンプレート化したり、使い回す事を想定したクラス名を設定する
- 【課題】実装時は、エラーが出ずに想定の動きをしてくれるように、コードを調べたり書いたりすることに必死で、今ではあまり使われていなかったり、別のコードが推奨されていたりするものが一部混ざっているかもしれない
  - 【改善策】日々新たな知識を取り入れつつも、既に得ている知識に安心せずに、脳のアップデートを常に行っていく
### デザイン性
- 【課題】どのように配色や文字の配置をしていけば見やすいか・綺麗かというセンスが低く、頭の中のイメージを表現することにかなりの時間を要した。また一部妥協をしてしまった。
  - 【改善策】日々の生活の中で、様々なデザインに触れることがある為、色の使い方や文字のバランスまでも含め、意識して生活をし、開発に還元していく
### 知識
- 【課題】スクールで得られた知識は基礎中の基礎。思い描いている機能を実装するためには、引き出しが圧倒的に少ない
  - 【改善策】調べるだけだと身に付かず、その場で終わってしまう可能性が高いため、気になったことはすぐ調べ、実際に動かしてみる。

# テーブル設計

## usersテーブル

|Column                   |Type    |Options                  |
|-------------------------|--------|-------------------------|
|nickname                 |string  |null: false              |
|email                    |string  |null: false, unique: true|
|encrypted_password       |string  |null: false              |
|gender_id                |integer |null: false              |
|birthday                 |date    |null: false              |
|have_pet_id              |integer |                         |
|profile                  |text    |                         |

### Association
- has_many :articles
- has_many :comments
- has_many :favorites
- has_many :pets
- has_many :tasks
- has_many :relationships(active_relationships)
- has_many :relationships(passive_relationships)


## articlesテーブル

|Column               |Type      |Options          |
|---------------------|----------|-----------------|
|title                |string    |null: false      |
|text                 |text      |null: false      |
|pet_type_id          |integer   |null: false      |
|text_type_id         |integer   |null: false      |
|publishing_setting_id|integer   |null: false      |
|user_id              |references|foreign_key: true|


### Association
- belongs_to :user
- has_many :comments
- has_many :favorites


## commentsテーブル

|Column    |Type      |Options          |
|----------|----------|-----------------|
|comment   |text      |null: false      |
|user_id   |references|foreign_key: true|
|article_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :article


## favoritesテーブル

|Column    |Type      |Options          |
|----------|----------|-----------------|
|user_id   |references|foreign_key: true|
|article_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :article


## petsテーブル

|Column     |Type      |Options          |
|-----------|----------|-----------------|
|name       |string    |null: false      |
|pet_type_id|integer   |null: false      |
|feature    |text      |null: false      |
|birthday   |date      |null: false      |
|age        |integer   |null: false      |
|user_id    |references|foreign_key: true|

### Association
- belongs_to :user


## tasksテーブル

|Column       |Type      |Options          |
|-------------|----------|-----------------|
|datetime     |datetime  |null: false      |
|title        |string    |null: false      |
|content      |text      |                 |
|task_type    |integer   |null: false      |
|notice       |integer   |null: false      |
|user_id      |references|foreign_key: true|

### Association
- belongs_to :user


## relationshipsテーブル

|Column      |Type   |Options|
|------------|-------|-------|
|following_id|integer|       |
|follower_id |integer|       |


### Association
- belongs_to :user(following)
- belongs_to :user(follower)