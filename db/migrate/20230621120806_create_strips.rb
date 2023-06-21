class CreateStrips < ActiveRecord::Migration[5.0]
  def change
    create_table :strips do |t|
      t.references :strip_batch
      t.integer :status, null: false, default: 0
    end
  end
end
