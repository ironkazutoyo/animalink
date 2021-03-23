class RenameDatetimeColumnToTasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :datetime, :start_time
  end
end
