namespace :demo do

  task :quiz, [:address] => :environment do
    desc "generate demo quiz"
    
    raise "This task should not be executed in other environment than development!" unless ::Rails.env == "development"
      
    quiz = Quiz.new(:name => "The Amazing Demo Quiz")
    
      
  end

end