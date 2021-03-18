class PetType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '犬' },
    { id: 3, name: '猫' },
    { id: 4, name: 'フェレット' },
    { id: 5, name: 'モルモット' },
    { id: 6, name: 'ハムスター' },
    { id: 7, name: 'ハリネズミ' },
    { id: 8, name: 'チンチラ' },
    { id: 9, name: 'デグー' },
    { id: 10, name: 'インコ' },
    { id: 11, name: '小鳥' },
    { id: 12, name: 'あひる' },
    { id: 13, name: 'ふくろう' },
    { id: 14, name: 'リス' },
    { id: 15, name: 'うさぎ' },
    { id: 16, name: '魚' },
    { id: 17, name: 'レオパ' },
    { id: 18, name: 'トカゲ' },
    { id: 19, name: 'ヘビ' },
    { id: 20, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
end