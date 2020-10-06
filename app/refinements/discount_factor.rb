module DiscountFactor
  refine Numeric do
    def factor
      1 - self / 100.0
    end
  end
end
