class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.datetime :date, null: false
      t.integer :test_type, null: false
      t.references :user, null: false
      t.references :strip, null: false, index: { unique: true }
    end
  end
end
