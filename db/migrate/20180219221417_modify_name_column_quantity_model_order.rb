class ModifyNameColumnQuantityModelOrder < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :qunatity, :quantity
  end
end
