class CreateStripHormones < ActiveRecord::Migration[5.0]
  def change
    create_table :strip_hormones do |t|
      t.references :strip, null: false
      t.references :hormone, null: false
    end
  end
end
