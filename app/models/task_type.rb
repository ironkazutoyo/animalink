class TaskType < ActiveHash::Base
  self.data = [
    { id: 1, name: '予定' },
    { id: 2, name: '記録' }
  ]

  include ActiveHash::Associations
  has_many :tasks
end