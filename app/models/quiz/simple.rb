class Quiz::Simple < Quiz::Base
  self.round_types = [
      ['Simple', Round::Simple],
      ['Blockbusters', Round::Blockbuster],
      ['Jeopardy', Round::Jeopardy]
    ]
end