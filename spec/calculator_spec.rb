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
      net_amount, commission = described_class.call(12.34)

      expect(net_amount).to eq(12.34)
      expect(commission).to eq(0)
    end
  end
end
