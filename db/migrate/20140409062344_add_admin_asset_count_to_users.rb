class AddAdminAssetCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin_teams_count, :integer, default: 0
    add_column :users, :admin_projects_count, :integer, default: 0
  end
end
