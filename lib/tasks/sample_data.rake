require 'faker'
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    100.times do 
      qu=Question::Simple.create!(:problem => Faker::Company.bs, :solution => Faker::Company.catch_phrase)
      qu.categories << Category.all.sample(rand(3)+1)
    end
    
    15.times do
      r=Round::Jeopardy.create!(:name => Faker::Internet.domain_word,
                                :number_of_categories => (rand(4)+3),
                                :questions_per_category => (rand(3)+3))
      r.categories = Category.all.sample(r.number_of_categories)
      r.save!
    end
    
    questions = Question::Simple.all
    RoundQuestion::GridSlot.all.each do |rq|
      rq.question = questions.sample
      rq.save!
    end
    
    5.times do
      q=Quiz::Simple.create!(:name => Faker::Internet.domain_word)
      q.rounds << Round::Base.all.sample(rand(3)+3)
      q.categories << Category.all.sample(rand(3)+1)
      q.save!
    end
  end
  
end