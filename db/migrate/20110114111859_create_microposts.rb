class CreateMicroposts < ActiveRecord::Migration
  def self.up
    create_table :microposts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :location_id
      t.integer :category_id
      t.integer :compensation
      t.timestamps
    end
    add_index :microposts, :user_id
    add_index :microposts, :location_id
    add_index :microposts, :category_id
  end

  def self.down
    drop_table :microposts
  end
end
