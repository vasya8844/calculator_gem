## Rebuild gem
gem build calculator_gem
gem install calculator_gem

## Usage example
```
require 'calculator_gem'
pp CalculatorGem::Calculator.call(
  amount: 200,
  commission_amount: 10, commission_percent: 20
)
```

## Run tests
bundle
rspec
