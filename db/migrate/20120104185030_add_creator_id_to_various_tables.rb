class AddCreatorIdToVariousTables < ActiveRecord::Migration
  def self.up
    add_column :quizzes, :creator_id, :integer
    add_column :rounds, :creator_id, :integer
    add_column :questions, :creator_id, :integer
  end

  def self.down
    remove_column :quizzes, :creator_id
    remove_column :rounds, :creator_id
    remove_column :questions, :creator_id
  end
end
