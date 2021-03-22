class RenameTaskTypeColumnToTasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :task_type, :task_type_id
  end
end
