class AddAvartarUrlToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avartar_url, :string
  end
end
