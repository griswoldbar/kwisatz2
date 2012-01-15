class CreateObjectCategories < ActiveRecord::Migration
  def self.up
    create_table :object_categories do |t|
      t.references :categorisable, polymorphic:true
      t.references :category
    end
    add_index :object_categories, :category_id
    add_index :object_categories, [:categorisable_id,:categorisable_type], name:"index_object_categories_on_categorisable_name_and_type"
  end

  def self.down
    drop_table :object_categories
  end
end
