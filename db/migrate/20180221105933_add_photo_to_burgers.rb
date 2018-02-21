class AddPhotoToBurgers < ActiveRecord::Migration[5.1]
  def change
    add_column :burgers, :photo, :string
  end
end
