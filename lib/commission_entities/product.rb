class Product
  attr_reader :commission_percent, :commission_amount
  def initialize(commission_percent:, commission_amount: nil)
    @commission_percent = commission_percent
    @commission_amount = commission_amount || 20
  end
end
