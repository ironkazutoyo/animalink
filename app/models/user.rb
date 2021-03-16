class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :gender_id, numericality: { other_than: 1, message: 'Select' }
    validates :birthday
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
end
