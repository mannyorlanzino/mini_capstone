class AddSupplierToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :supplier_id, :string
  end
end
