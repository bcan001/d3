class CreateStatics < ActiveRecord::Migration
  def change
    create_table :statics do |t|
      t.integer :year
      t.integer :deaths

      t.timestamps null: false
    end
  end
end
