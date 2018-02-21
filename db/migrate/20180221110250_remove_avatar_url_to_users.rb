class RemoveAvatarUrlToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :avartar_url
  end
end
