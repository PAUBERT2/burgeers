class RemoveImageUrlToBurgers < ActiveRecord::Migration[5.1]
  def change
    remove_column :burgers, :image_url
  end
end
