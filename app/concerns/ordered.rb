module Ordered
  extend ActiveSupport::Concern

  included do
    serialized_attr_accessor :position
  end

end