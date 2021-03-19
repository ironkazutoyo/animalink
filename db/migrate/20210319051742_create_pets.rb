class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name,         null: false
      t.integer :pet_type_id, null: false
      t.text :feature,        null: false
      t.date :birthday,       null: false
      t.integer :age,         null: false
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
