class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.string :name
      t.string :title
      t.string :description
      t.string :keywords
      
      t.timestamps
    end
  end

  def self.down
    drop_table :domains
  end
end
