class HavePet < ActiveHash::Base
  self.data = [
    { id: 1, name: 'Yes' },
    { id: 2, name: "No" },
    { id: 3, name: 'Want(Future)' },
    { id: 4, name: 'NoAnswer' },
  ]

  include ActiveHash::Associations
  has_many :users
end