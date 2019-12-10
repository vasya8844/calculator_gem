describe CalculatorGem::Calculator do
  let(:amount) { 200 }
  let(:commission_amount) { 10 }
  let(:commission_percent) { 20 }
  it 'calculates net and commission' do
    net, commission = described_class.call(
      amount: 200,
      commission_amount: commission_amount, commission_percent: commission_percent
    )

    expect(net).to eq(150)
    expect(commission).to eq(50)
  end
end
