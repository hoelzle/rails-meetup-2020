class AddCodeToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :code_name, :string
  end
end
