class Question::Simple < Question::Base
  include Question::Problem
  include Question::Solution
  
end