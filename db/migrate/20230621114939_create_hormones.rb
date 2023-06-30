class CreateHormones < ActiveRecord::Migration[5.0]
  def change
    create_table :hormones do |t|
      t.string :name, null: false
      t.index :name, unique: true
    end
  end
end
