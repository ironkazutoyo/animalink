class Task < ApplicationRecord

  validate :schedule_cannot_be_in_the_past


  with_options presence: true do
    validates :title
  end

  with_options presence: true, numericality: { message: 'Select' } do
    validates :task_type_id
    validates :notice_id
  end


  def schedule_cannot_be_in_the_past
    if datetime == nil
      errors.add(:datetime, "can't be blank.")
    elsif (task_type_id == 1) && datetime.past?
      errors.add(:datetime, "can't specify your past date as your '予定'.")
    end
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :task_type
  belongs_to :notice
end
