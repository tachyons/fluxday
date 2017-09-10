class AddTaskIdToWorkLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :work_logs, :task_id, :integer
    add_column :work_logs, :minutes, :integer
    add_column :work_logs, :description, :text
    remove_column :work_logs, :task, :string
  end
end
