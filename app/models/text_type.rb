class TextType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '日記' },
    { id: 3, name: '豆知識' },
    { id: 4, name: '知恵袋' },
    { id: 5, name: '闘病' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
end