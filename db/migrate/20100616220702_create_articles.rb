class CreateArticles < ActiveRecord::Migration
  def self.up
    add_column :elements, :body, :text
  end

  def self.down
    remove_column :elements, :body
  end
end

