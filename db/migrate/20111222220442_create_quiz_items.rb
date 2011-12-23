class CreateQuizItems < ActiveRecord::Migration
  def self.up
    create_table :quiz_items do |t|
      t.references :quiz
      t.text :data
      t.timestamps
    end
    
    add_index :quiz_items, :quiz_id
    
  end

  def self.down
    drop_table :quiz_items
  end
end
