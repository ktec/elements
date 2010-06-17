class CreatePages < ActiveRecord::Migration
  def self.up
    add_column :elements, :description, :string
    add_column :elements, :keywords, :string
  end

  def self.down
    remove_column :elements, :description
    remove_column :elements, :keywords
  end
end
