class AddBatchSize < ActiveRecord::Migration[5.0]
  def change
    add_column :strip_batches, :batch_size, :integer, default: 0, null: false
  end
end
