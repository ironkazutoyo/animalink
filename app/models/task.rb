class Task < ApplicationRecord

  validate :schedule_cannot_be_in_the_past


  with_options presence: true do
    validates :title
  end

  with_options presence: true, numericality: { message: 'を選択してください' } do
    validates :task_type_id
    validates :notice_id
  end


  def schedule_cannot_be_in_the_past
    if start_time == nil
      errors.add(:start_time, "は必須です")
    elsif (task_type_id == 1) && start_time.past?
      errors.add(:start_time, "には、予定日を過去日で設定できません。")
    elsif (task_type_id == 2) && start_time.future?
      errors.add(:start_time, "には、記録日を未来日で設定できません。")
    end
  end

  belongs_to :user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :task_type
  belongs_to :notice
end
