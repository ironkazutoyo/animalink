class Article < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :image
    validates :text, length: { maximum: 400, message: 'は400文字以内で記入してください' }
    validates :pet_type_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :text_type_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :publishing_setting_id, numericality: { message: 'を選択してください' }
    validates :user
  end


  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pet_type
  belongs_to :text_type
  belongs_to :publishing_setting
end
