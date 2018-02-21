class ChangeDefaultValueDelieverdToOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :delivered, :boolean, default: false
  end
end
