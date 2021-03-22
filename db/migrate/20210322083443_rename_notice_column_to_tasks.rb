class RenameNoticeColumnToTasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :notice, :notice_id
  end
end
