class CreateStripBatches < ActiveRecord::Migration[5.0]
  def change
    create_table :strip_batches do |t|
      t.integer :test_type, null: false
      t.string :manufacturer, null: false
      t.datetime :mfd, null: false
      t.datetime :expd, null: false
    end
  end
end
