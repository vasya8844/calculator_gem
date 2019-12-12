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
    it 'uses default commission' do
      net_amount, commission = described_class.call(amount: 200)

      expect(net_amount).to eq(115.00)
      expect(commission).to eq(85.00)
    end
  end

  context 'when product entity provided' do
    let(:product) { CalculatorGem::Product.new(commission_amount: 5, commission_percent: 10) }
    context 'when no commission arguments provided' do
      it 'calculates values' do
        net_amount, commission = described_class.call(amount: 100, commission_entity: product)

        expect(net_amount).to eq(85)
        expect(commission).to eq(15)
      end
    end

    context 'when commission arguments provided' do
      it 'does not pay attention on commission arguments' do
        net_amount, commission = described_class.call(amount: 100,
          commission_amount: 10, commission_percent: 20,
          commission_entity: product
        )

        expect(net_amount).to eq(85)
        expect(commission).to eq(15)
      end
    end
  end

  context 'when user entity provided' do
    let(:user) { CalculatorGem::User.new(commission_amount: 5, commission_percent: 10) }
    context 'when only commission entity provided' do
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
