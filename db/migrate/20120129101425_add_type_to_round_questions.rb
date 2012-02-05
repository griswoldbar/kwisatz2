class AddTypeToRoundQuestions < ActiveRecord::Migration
  def change
    add_column :round_questions, :type, :string
  end
end
