class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.references :parent_category
      t.references :creator
    end
    add_index :categories, :parent_category_id
    add_index :categories, :creator_id
    
  end

  def self.down
    drop_table :categories
  end
end