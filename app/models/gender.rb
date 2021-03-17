class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: 'male' },
    { id: 2, name: 'femele' },
    { id: 3, name: 'Neutral' },
    { id: 4, name: 'NoAnswer' },
  ]

  include ActiveHash::Associations
  has_many :users
end