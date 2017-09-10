class AddColumnsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :team_count, :integer, default: 0
    add_column :projects, :member_count, :integer, default: 0
    add_column :projects, :website, :string
  end
end
