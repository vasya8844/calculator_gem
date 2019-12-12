require_relative 'entities/product'
require_relative 'entities/user'

module CalculatorGem
  class Calculator
    DEFAULT_COMMISSION_AMOUNT = 15
    DEFAULT_COMMISSION_PERCENT = 35

    def self.call(amount:,
                  commission_amount: nil, commission_percent: nil,
                  commission_entity: nil
      )

      new(amount: amount,
        commission_amount: commission_amount, commission_percent: commission_percent,
        commission_entity: commission_entity
      ).calculate
    end

    def initialize(amount:,
                   commission_amount: nil, commission_percent: nil,
                   commission_entity: nil
      )

      @amount = amount

      @commission_amount = commission_amount
      @commission_percent = commission_percent
      apply_commission_entity(commission_entity)
      apply_default_commission
    end

    def calculate
      total_commission_amount = @commission_amount
      total_commission_amount += @amount * @commission_percent / 100.0
      total_commission_amount = total_commission_amount.round(2)

      [@amount - total_commission_amount, total_commission_amount]
    end

    private

    def apply_commission_entity(commission_entity)
      return unless commission_entity

      @commission_amount = commission_entity.commission_amount
      @commission_percent = commission_entity.commission_percent
    end

    def apply_default_commission
      @commission_amount ||= DEFAULT_COMMISSION_AMOUNT
      @commission_percent ||= DEFAULT_COMMISSION_PERCENT
    end
  end
end
