class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|

      t.text :text, null: false
      t.integer :pet_type_id, null: false
      t.integer :text_type_id, null: false
      t.integer :publishing_setting_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
      
    end
  end
end
