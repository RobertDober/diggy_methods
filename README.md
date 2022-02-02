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

An extension to the Kernel as an alias for `Lab42::DiggyMethods.new`

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

And we can use a shortcut for `key.__data__` by using `key!`
```ruby
    expect(diggy.b.d!).to eq(e: 3)
```

And that works for leave nodes too of course
```ruby
    expect(diggy.a!).to eq(1)
```

And in case of missing keys
```ruby
    expect{ diggy.b.d.f }.to raise_error(KeyError, "key not found: b.d.f")
```

And this works for arrays too:
```ruby
    with_array = Diggy(a: [b: {}])
    expect { with_array.a.first.b.c }.to raise_error(KeyError, "key not found: a.b.c")
```

If we access unknown keys we get the usual `KeyError` error, however we must not pass, nonhashable data

But if we pass an array
```ruby
    expect{ Diggy([:a]) }.to raise_error(ArgumentError)
```

### Context: Using in ERB with `__binding__`

In order to take advantage of this syntax we want to pass the binding of a `Diggy` object to `ERB`

Given an `ERB` template
```ruby
    require 'erb'
    let(:template_text) { "<%= data.person.name %>" }
```

And a `Lab42::DiggyMethod` instance
```ruby
    let(:data) { Diggy(data: {person: {name: "YHS"}}) }
```

Then we can pass the binding to the template
```ruby
    expect(ERB.new(template_text).result(data.__binding__)).to eq("YHS")
```

### Context: Iteration

If an element in a diggy object is an array we descend

Given yet another diggy™
```ruby
    let(:diggy) { Diggy(a: [b: 1, c: 2]) }
```

Then we get an array
```ruby
    expect(diggy.a).to be_an(Array)
```

And it contains diggy instances
```ruby
    expect(diggy.a.first.b).to eq(1)
```

# LICENSE

Copyright 2022 Robert Dober robert.dober@gmail.com

Apache-2.0 [c.f LICENSE](LICENSE)
<!-- SPDX-License-Identifier: Apache-2.0-->
