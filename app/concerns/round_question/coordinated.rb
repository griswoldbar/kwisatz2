module RoundQuestion::Coordinated
  extend ActiveSupport::Concern

  included do
    serialized_attr_accessor :x, :y
  end

end