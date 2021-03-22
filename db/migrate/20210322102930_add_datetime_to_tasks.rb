class AddDatetimeToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :datetime, :datetime
  end
end
