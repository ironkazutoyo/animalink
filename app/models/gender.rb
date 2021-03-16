class DaysToShip < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'male' },
    { id: 3, name: 'femele' },
    { id: 4, name: 'Neutral' }
  ]

  include ActiveHash::Associations
  has_many :users
end