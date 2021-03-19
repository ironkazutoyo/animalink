class Pet < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :pet_type_id
    validates :feature
    validates :birthday
    validates :age
    validates :user
  end

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pet_type

end
