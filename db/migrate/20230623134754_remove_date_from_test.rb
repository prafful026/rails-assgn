class RemoveDateFromTest < ActiveRecord::Migration[5.0]
  def change
    remove_column :tests, :date
  end
end
