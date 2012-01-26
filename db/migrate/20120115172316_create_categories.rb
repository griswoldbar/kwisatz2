class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.references :parent_category
      t.references :creator
    end
    add_index :categories, :parent_category_id
    add_index :categories, :creator_id
    [:music, 
     :film,
     :science, 
     :geography,
     :literature,
     :history,
     :famous_people,
     :food_and_drink,
     :other].each do |name|
     Category.create(name:name)
    end
  end

  def self.down
    drop_table :categories
  end
end