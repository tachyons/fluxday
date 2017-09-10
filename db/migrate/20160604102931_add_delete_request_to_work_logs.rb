class AddDeleteRequestToWorkLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :work_logs, :delete_request, :boolean, default: false
  end
end
