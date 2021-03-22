class Notice < ActiveHash::Base
  self.data = [
    { id: 1, name: '通知' },
    { id: 2, name: '非通知' }
  ]

  include ActiveHash::Associations
  has_many :tasks
end