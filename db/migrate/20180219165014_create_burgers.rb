class CreateBurgers < ActiveRecord::Migration[5.1]
  def change
    create_table :burgers do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.float :price
      t.integer :quantity_max
      t.string :opening_days
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
