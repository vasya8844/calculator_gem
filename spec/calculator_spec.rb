describe CalculatorGem::Calculator do
  context 'when commission is round number' do
    it 'calculates net_amount and commission' do
      net_amount, commission = described_class.call(
        amount: 100,
        commission_amount: 1, commission_percent: 20
      )

      expect(net_amount).to eq(79)
      expect(commission).to eq(21)
    end
  end

  context 'when commission is not round number' do
    it 'calculates net_amount and commission' do
      net_amount, commission = described_class.call(
        amount: 10,
        commission_amount: 1.25, commission_percent: 28
      )

      expect(net_amount).to eq(5.95)
      expect(commission).to eq(4.05)
    end
  end

  context 'when only amount provided' do
    it 'calculates net_amount and commission' do
      net_amount, commission = described_class.call(amount: 12.34)

      expect(net_amount).to eq(12.34)
      expect(commission).to eq(0)
    end
  end

  context 'when product entity provided' do
    let(:product) { CalculatorGem::Product.new(commission_amount: 5, commission_percent: 10) }
    context 'when only amount provided' do
      it 'calculates net_amount and commission' do
        net_amount, commission = described_class.call(amount: 100,
          commission_amount: 10, commission_percent: 20,
          commission_entity: product
        )

        expect(net_amount).to eq(55)
        expect(commission).to eq(45)
      end
    end
  end

  context 'when user entity provided' do
    let(:user) { CalculatorGem::User.new(commission_amount: 5, commission_percent: 10) }
    context 'when only amount provided' do
      it 'calculates net_amount and commission' do
        net_amount, commission = described_class.call(amount: 100,
          commission_entity: user
        )

        expect(net_amount).to eq(85)
        expect(commission).to eq(15.00)
      end
    end
  end
end
