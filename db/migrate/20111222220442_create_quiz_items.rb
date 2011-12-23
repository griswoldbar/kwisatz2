class CreateQuizItems < ActiveRecord::Migration
  def self.up
    create_table :quiz_items do |t|
      t.references :quiz
      t.text :data
      t.timestamps
      t.index :quiz_id
    end
    
  end

  def self.down
    drop_table :quiz_items
  end
end
