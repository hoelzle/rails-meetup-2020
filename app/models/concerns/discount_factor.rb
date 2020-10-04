module Concerns
  module DiscountFactor
    def factor(discount)
      1 - (discount || 0) / 100.0
    end
  end
end
