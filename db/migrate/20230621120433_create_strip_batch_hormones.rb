class CreateStripBatchHormones < ActiveRecord::Migration[5.0]
  def change
    create_table :strip_batch_hormones do |t|
      t.references :strip_batch, null: false
      t.references :hormone, null: false
    end
  end
end
