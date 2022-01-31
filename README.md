[![Issue Count](https://codeclimate.com/github/RobertDober/diggy_methods/badges/issue_count.svg)](https://codeclimate.com/github/RobertDober/diggy_methods)
[![Gem Version](http://img.shields.io/gem/v/lab42_diggy_methods.svg)](https://rubygems.org/gems/lab42_diggy_methods)
[![CI](https://github.com/robertdober/diggy_methods/workflows/CI/badge.svg)](https://github.com/robertdober/diggy_methods/actions)
[![Coverage Status](https://coveralls.io/repos/github/RobertDober/diggy_methods/badge.svg?branch=main)](https://coveralls.io/github/RobertDober/diggy_methods?branch=main)


# Lab42::DiggyMethods

Access (nested) hash values by means of method chaining

## Usage

```sh
gem install lab42_diggy_methods
```

With bundler

```ruby
  gem 'lab42_diggy_methods'
```

In your code

```ruby
require 'lab42/diggy_methods'
```


## So what does it do?

Well let us [speculate about](https://github.com/RobertDober/speculate_about) it to find out:

### Context: `Diggy` function

An extension to the Kernel as an alias to `Lab42::DiggyMethods.new`

Given
```ruby
    let(:data) { {a: 1, b: {c: 2, d: {e: 3}}} }
    let(:diggy) { Diggy(**data) }
```

Then we can access its fields as follows
```ruby
  expect(diggy.a).to eq(1)
  expect(diggy.b.d.__data__).to eq(e: 3)
  expect(diggy.b.d.e).to eq(3)
```

And in case of missing keys
```ruby
    expect{ diggy.b.d.f }.to raise_error(KeyError, "key not found: :f")
```

If we access unknown keys we get the usual `KeyError` error, however we must not pass, nonhashable data

But if we pass an array
```ruby
    expect{ Diggy([:a]) }.to raise_error(ArgumentError)
```

# LICENSE

Copyright 2022 Robert Dober robert.dober@gmail.com

Apache-2.0 [c.f LICENSE](LICENSE)
<!-- SPDX-License-Identifier: Apache-2.0-->
