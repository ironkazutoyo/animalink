class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: { message: 'は必須です' }, format: { with: VALID_EMAIL_REGEX, message: 'は正しく入力してください' }, uniqueness: { case_sensitive: false, message: 'が既に登録されています' }}

  with_options presence: { message: 'は必須です' } do
    validates :nickname
    validates :password, confirmation: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'はアルファベットと数字を含む6文字以上必要です' }, on: :create
    validates :password_confirmation, on: :create
    validates :gender_id, numericality: { message: 'を選んでください' }
    validates :birthday
  end

  validates :profile, length: { maximum: 200, message: 'は200文字以内で記入してください' }

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  has_many :articles
  has_many :pets

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :have_pet
end
