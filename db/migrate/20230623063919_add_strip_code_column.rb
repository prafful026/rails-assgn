class AddStripCodeColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :strips, :code, :uuid, null: false
    add_index :strips, :code, unique: true
  end
end



