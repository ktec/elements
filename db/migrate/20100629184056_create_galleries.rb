class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :title
      t.string :description
      t.string :layout_name
      t.text :custom_layout_content
      
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
