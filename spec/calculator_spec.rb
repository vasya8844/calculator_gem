describe CalculatorGem::Calculator do
  context 'when commission is round number' do
    it 'calculates netto_amount and commission' do
      netto_amount, commission = described_class.call(
        amount: 100,
        commission_amount: 1, commission_percent: 20
      )

      expect(netto_amount).to eq(79)
      expect(commission).to eq(21)
    end
  end

  context 'when commission is not round number' do
    it 'calculates netto_amount and commission' do
      netto_amount, commission = described_class.call(
        amount: 10,
        commission_amount: 1.25, commission_percent: 28
      )

      expect(netto_amount).to eq(5.95)
      expect(commission).to eq(4.05)
    end
  end
end
