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
    it "in case of missing keys (README.md:52)" do
      expect{ diggy.b.d.f }.to raise_error(KeyError, "key not found: :f")
    end
  end
end