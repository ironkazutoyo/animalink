class Pet < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :image
    validates :pet_type_id, numericality: { other_than: 1, message: 'Select' }
    validates :feature
    validates :user
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pet_type

end
