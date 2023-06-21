class CreateTestHormones < ActiveRecord::Migration[5.0]
  def change
    create_table :test_hormones do |t|
      t.references :test, null: false
      t.references :hormone, null: false
      t.integer :od_value, null: false
      t.integer :concentration, null: false
    end
  end
end
