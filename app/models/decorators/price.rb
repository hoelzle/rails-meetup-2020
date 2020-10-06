module Decorators
  class Price < Decorators::Context
    alias customer context
    delegate :name, to: :code, prefix: true

    def price
      lowest.price
    end

    def net_price
      lowest.net_price
    end

    def discount
      lowest.discount
    end

    private

    def price_classes
      [Decorators::RegularPrice]
    end

    def prices
      @prices ||= price_classes.map { |price| price.new __getobj__, customer }
    end

    def lowest
      @lowest ||= prices.reduce do |lowest, other|
        other.net_price < lowest.net_price ? other : lowest
      end
    end
  end
end
