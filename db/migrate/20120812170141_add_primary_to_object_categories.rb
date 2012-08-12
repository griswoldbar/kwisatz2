class AddPrimaryToObjectCategories < ActiveRecord::Migration
  def change
    add_column :object_categories, :primary, :boolean
    add_index :object_categories, [:primary, :categorisable_id, :categorisable_type], name: "index_on_primary_and_categorisable"
  end
end