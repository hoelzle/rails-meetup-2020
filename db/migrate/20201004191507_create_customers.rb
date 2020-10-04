class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :discount, limit: 1

      t.timestamps
    end
  end
end
