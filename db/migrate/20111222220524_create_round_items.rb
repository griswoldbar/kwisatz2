class CreateRoundItems < ActiveRecord::Migration
  def self.up
    create_table :round_items do |t|
      t.references :round
      t.text :data
      t.timestamps
    end
    
    add_index :round_items, :round_id
  end

  def self.down
    drop_table :round_items
  end
end
