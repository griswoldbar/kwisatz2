class CreateQuestionItems < ActiveRecord::Migration
  def self.up
    create_table :question_items do |t|
      t.references :question
      t.timestamps
      t.index :question_id
    end
  end

  def self.down
    drop_table :question_items
  end
end
