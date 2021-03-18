class AddTitleToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :title, :string
  end
end

# 入れ忘れのため、articlesテーブルへtitleカラム追加