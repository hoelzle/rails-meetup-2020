module Decorators
  class RegularPrice < Decorators::Context
    using DiscountFactor
    alias customer context

    def price
      self[:price]
    end

    def net_price
      price * discount.factor
    end

    def discount
      code.discount customer.discount
    end
  end
end
