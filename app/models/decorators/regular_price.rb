module Decorators
  class RegularPrice < Decorators::Context
    include Concerns::DiscountFactor
    alias customer context

    def price
      self[:price]
    end

    def net_price
      price * factor(discount)
    end

    def discount
      code.discount customer.discount
    end
  end
end
