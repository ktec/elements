class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.boolean :show_share_links, :default => true
      t.string :layout_name, :default => "application"
      t.text :custom_layout_content

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
