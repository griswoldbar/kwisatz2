class CreateQuestionCategories < ActiveRecord::Migration
  def self.up
    create_table :question_categories do |t|
      t.string :name
      t.text :sub_categories
    end
    [:music, 
     :film,
     :science, 
     :geography,
     :literature,
     :history,
     :famous_people,
     :food_and_drink,
     :other].each do |name|
     QuestionCategory.create(:name => name)
    end
  end

  def self.down
    drop_table :question_categories
  end
end
