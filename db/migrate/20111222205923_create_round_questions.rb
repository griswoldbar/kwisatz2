class CreateRoundQuestions < ActiveRecord::Migration
  def self.up
    create_table :round_questions do |t|
      t.references :round
      t.references :question
    end
    
    add_index :round_questions, :round_id
    add_index :round_questions, :question_id
    add_index :round_questions, [:round_id, :question_id]
  end

  def self.down
    drop_table :round_questions
  end
  
end
