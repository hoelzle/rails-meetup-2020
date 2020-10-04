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

    # MR
    def volume_discount(*)
      nil
    end

    def quantities
      # Do not enter in volume_prices
    end
  end
end
