class TextType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '我が子自慢' },
    { id: 3, name: '我が子紹介' },
    { id: 4, name: '耳寄り情報' },
    { id: 5, name: '知恵袋' },
    { id: 6, name: '闘病' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
end