class Task < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :start_time
  end

  with_options presence: true, numericality: { message: 'を選択してください' } do
    validates :task_type_id
    validates :notice_id
  end


  belongs_to :user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :task_type
  belongs_to :notice
end
