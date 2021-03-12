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

|Column  |Type      |Options          |
|--------|----------|-----------------|
|datetime|datetime  |null: false      |
|title   |string    |null: false      |
|content |text      |                 |
|type    |integer   |null: false      |
|notice  |integer   |null: false      |
|user_id |references|foreign_key: true|

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