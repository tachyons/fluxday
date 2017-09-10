class CreateReportingManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :reporting_managers do |t|
      t.integer :user_id
      t.integer :manager_id

      t.timestamps
    end
  end
end
