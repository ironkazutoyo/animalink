class Task < ApplicationRecord


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :task_type
  belongs_to :notice
end
