class Task < ApplicationRecord

  with_options presence: true do
    validates :datetime
    validates :title
  end

  with_options presence: true, numericality: { message: 'Select' } do
    validates :task_type_id
    validates :notice_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :task_type
  belongs_to :notice
end
