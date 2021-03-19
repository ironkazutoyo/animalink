class Article < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :image
    validates :text, length: { maximum: 400 }
    validates :pet_type_id, numericality: { other_than: 1, message: 'Select' }
    validates :text_type_id, numericality: { other_than: 1, message: 'Select' }
    validates :publishing_setting_id, numericality: { message: 'Select' }
    validates :user
  end


  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pet_type
  belongs_to :text_type
  belongs_to :publishing_setting
end
