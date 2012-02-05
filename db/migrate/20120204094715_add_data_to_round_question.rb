class AddDataToRoundQuestion < ActiveRecord::Migration
  def change
    add_column :round_questions, :data, :text
  end
end
