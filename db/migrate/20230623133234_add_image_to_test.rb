class AddImageToTest < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :image, :string, null: false
  end
end
