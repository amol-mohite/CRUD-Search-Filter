class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name
      t.integer :lowest_price
      t.float :rating, default: 0.0
      t.string :max_speed
      t.text :description
      t.string :contact_no
      t.string :email
      t.string :image
      t.string :url
      t.timestamps
    end
  end
end
