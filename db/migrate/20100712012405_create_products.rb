class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :shop_id, :integer
      t.string :name
      t.string :title
      t.string :description
      t.date :expiration_date
      t.string :image_link
      t.string :link
      t.string :location
      t.string :payment_accepted
      t.string :payment_notes
      t.boolean :pickup
      t.integer :price
      t.string :price_type
      t.string :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
