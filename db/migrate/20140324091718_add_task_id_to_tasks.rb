class AddTaskIdToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :task_id, :integer
  end
end
