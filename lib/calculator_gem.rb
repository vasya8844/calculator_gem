module CalculatorGem
  class Calculator
    def self.call(amount:,
                  commission_amount: 0, commission_percent: 0,
                  commission_entity: nil)

      commission_amount += amount * commission_percent / 100.0
      commission_amount = commission_amount.round(2)

      [amount - commission_amount, commission_amount]
    end
  end
end
