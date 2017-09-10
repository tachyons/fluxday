class AddOkrFieldsToOAndKr < ActiveRecord::Migration[5.1]
  def change
    add_column :objectives, :okr_id, :integer
  end
end
