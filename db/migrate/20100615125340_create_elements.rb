class CreateElements < ActiveRecord::Migration
  def self.up
    create_table :elements do |t|
      t.string :name
      t.string :ancestry
      t.integer :ancestry_depth, :default => 0
      t.integer :position
      t.string :type
      t.integer :attachable_id
      t.string :attachable_type

      t.timestamps
    end
    add_index :elements, :ancestry
  end

  def self.down
    drop_table :elements
  end
end
