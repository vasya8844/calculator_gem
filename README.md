## Rebuild gem
gem build calculator_gem
gem install calculator_gem

## Usage example
```
require 'calculator_gem'
pp CalculatorGem::Calculator.calc
```

## Rub test
bundle
rspec
