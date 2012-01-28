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
      r=Round::Base.create!(:name => Faker::Internet.domain_word)
      r.categories << Category.all.sample(rand(3)+1)
      r.questions << Question::Base.all.sample(rand(5)+5)
    end
    
    5.times do
      q=Quiz::Simple.create!(:name => Faker::Internet.domain_word)
      q.rounds << Round::Base.all.sample(rand(3)+3)
      q.categories << Category.all.sample(rand(3)+1)
    end
  end
end