# DO NOT EDIT!!!
# This file was generated from "README.md" with the speculate_about gem, if you modify this file
# one of two bad things will happen
# - your documentation specs are not correct
# - your modifications will be overwritten by the speculate rake task
# YOU HAVE BEEN WARNED
RSpec.describe "README.md" do
  # README.md:34
  context "`Diggy` function" do
    # README.md:39
    let(:data) { {a: 1, b: {c: 2, d: {e: 3}}} }
    let(:diggy) { Diggy(**data) }
    it "we can access its fields as follows (README.md:45)" do
      expect(diggy.a).to eq(1)
      expect(diggy.b.d.__data__).to eq(e: 3)
      expect(diggy.b.d.e).to eq(3)
    end
    it "we can use a shortcut for `key.__data__` by using `key!`A (README.md:52)" do
      expect(diggy.b.d!).to eq(e: 3)
    end
    it "that works for leave nodes too of course (README.md:57)" do
      expect(diggy.a!).to eq(1)
    end
    it "in case of missing keys (README.md:62)" do
      expect{ diggy.b.d.f }.to raise_error(KeyError, "key not found: b.d.f")
    end
    it "this works for arrays too: (README.md:67)" do
      with_array = Diggy(a: [b: {}])
      expect { with_array.a.first.b.c }.to raise_error(KeyError, "key not found: a.b.c")
    end
    it "if we pass an array (README.md:75)" do
      expect{ Diggy([:a]) }.to raise_error(ArgumentError)
    end
  end
  # README.md:79
  context "Using in ERB" do
    # README.md:84
    require 'erb'
    let(:template_text) { "<%= data.person.name %>" }
    # README.md:90
    let(:data) { Diggy(data: {person: {name: "YHS"}}) }
    it "we can pass the binding to the template (README.md:95)" do
      expect(ERB.new(template_text).result(data.__binding__)).to eq("YHS")
    end
  end
  # README.md:99
  context "Iteration" do
    # README.md:104
    let(:diggy) { Diggy(a: [b: 1, c: 2]) }
    it "we get an enumerator (README.md:109)" do
      expect(diggy.a).to be_an(Array)
    end
    it "we can use it to iterate (README.md:114)" do
      expect(diggy.a.first.b).to eq(1)
    end
  end
end