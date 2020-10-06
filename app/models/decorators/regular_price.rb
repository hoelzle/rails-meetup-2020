module Decorators
  class RegularPrice < Decorators::Context
    include Concerns::DiscountFactor
    alias customer context

    def effective?(*)
      true
    end

    # Brutto
    def price(*)
      self[:price]
    end

    # Netto
    def net_price(*)
      price * factor(discount)
    end

    # GR
    def discount(*)
      code.discount customer.discount
    end
  end
end
