class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes, id: false do |t|
      t.string :name
      t.integer :type
      t.integer :discount
    end
    add_index :codes, :name
  end
end
