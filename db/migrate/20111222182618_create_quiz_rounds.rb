class CreateQuizRounds < ActiveRecord::Migration
  def self.up
    create_table :quiz_rounds do |t|
      t.references :quiz
      t.references :round
      t.timestamps
    end
    add_index :quiz_rounds, :quiz_id
    add_index :quiz_rounds, :round_id
    add_index :quiz_rounds, [:quiz_id, :round_id]
  end

  def self.down
    drop_table :quiz_rounds
  end
end
