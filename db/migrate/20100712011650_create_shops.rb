class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.boolean :show_share_links, :default => 1
      t.string :layout_name, :default => "default"
      t.text :custom_layout_content

      t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end
