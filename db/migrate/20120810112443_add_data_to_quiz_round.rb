class AddDataToQuizRound < ActiveRecord::Migration
  def change
    add_column :quiz_rounds, :data, :text
  end
end
