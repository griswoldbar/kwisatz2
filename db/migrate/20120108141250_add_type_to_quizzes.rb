class AddTypeToQuizzes < ActiveRecord::Migration
  def self.up
    add_column :quizzes, :type, :string
  end

  def self.down
    remove_column :quizzes, :type
  end
end
