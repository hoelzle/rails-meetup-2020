module Decorators
  class Price < Decorators::Context
    alias customer context
    delegate :name, to: :code, prefix: true

    def price(quantity = 1)
      effective(quantity).price quantity
    end

    def net_price(quantity = 1)
      effective(quantity).net_price quantity
    end

    def discount(quantity = 1)
      effective(quantity).discount quantity
    end

    def volume_discount(quantity = 1)
      effective(quantity).volume_discount quantity
    end

    private

    def regular
      @regular ||= Decorators::RegularPrice.new __getobj__, customer
    end

    def discount_sequence
      %i[regular]
    end

    def effective(quantity = 1)
      @effective ||= Hash.new do |eff, qty|
        eff[qty] = send(discount_sequence.detect { |msg| send(msg).effective? qty })
      end
      @effective[quantity]
    end
  end
end
