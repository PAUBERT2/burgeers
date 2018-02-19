class ChangeDefaultValueFromUserCooker < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :cooker, :boolean, :default => false
  end
end
