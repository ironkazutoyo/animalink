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

# 制作背景(意図)
⇒どんな課題や不便なことを解決するためにこのアプリを作っろうと思ったのか。
### 現状
- ペットの様々な記録を残していきたい
- 記録をよくつけ忘れてしまう
- 定期的にしないといけないことの、前回の実施日を覚えていない
### 課題
- 既存のアプリだと、用途別に複数のアプリを使わなければいけない
  - 結果、どれかのアプリが疎かになる為、記録のつけ忘れ等が起こってしまう
- 記録をつけておくだけのアプリは、そのためだけに使うことになる
  - アプリを開く機会が少なくなり、いざ記録をつけるときに忘れてしまう
- ペットを飼っていると、週一回や月一回しないといけないことがあるが、期間が長くなればなるほど、前回がいつだったかを覚えていられない
  - 気がついたら1週間のはずが2週間経っていたりする
### 解決策
- ひとつのアプリで完結させる
  - 普段から使うアプリとして1つが存在すれば、何か1つが疎かになることはない
  - 誰かとコミュニケーションが取れたり、日記や備忘録の投稿ができれば、アプリを開く機会が増える
  - 予定や記録をカレンダーに保存しておき、必要なものだけアプリのトップページに通知が出てくれば、しないといけない事を忘れにくくなる
<br>
<br>

# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
⇒できている範囲で貼り付けましょう。

# 実装予定の内容



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