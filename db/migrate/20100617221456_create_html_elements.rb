class CreateHtmlElements < ActiveRecord::Migration
  def self.up
    add_column :elements, :target, :string
  end

  def self.down
    remove_column :elements, :target
  end
end
