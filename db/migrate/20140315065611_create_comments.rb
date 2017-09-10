class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :source_id
      t.string :source_type
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
