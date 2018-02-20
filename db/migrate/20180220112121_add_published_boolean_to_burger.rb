class AddPublishedBooleanToBurger < ActiveRecord::Migration[5.1]
  def change
    add_column :burgers, :published, :boolean, default: true
  end
end
