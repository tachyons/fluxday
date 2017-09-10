class AddApprovalToOkrs < ActiveRecord::Migration[5.1]
  def change
    add_column :okrs, :approved, :boolean, default: false
  end
end
