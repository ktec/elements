class CreateParagraphs < ActiveRecord::Migration
  def self.up
    create_table :paragraphs do |t|
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :paragraphs
  end
end
