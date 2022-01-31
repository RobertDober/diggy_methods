RSpec.describe "Diggy" do
  context "merging hash and keywords" do
    let(:hash) { {a: 1} }
    let(:diggy) { Diggy(hash, b: 2) }

    it "provides both" do
      expect(diggy.a + diggy.b).to eq(3)
    end
  end

  context "needs a hashable at positional argument" do
    let(:legal) { [[:a, 1]] }
    let(:illegal) { [:a, 1] }
    it "converts" do
      expect(Diggy(legal).a).to eq(1)
    end
    it "but only if it can" do
      expect{ Diggy(illegal) }.to raise_error(ArgumentError, "positional argument must be a hash or respond to to_h if present")
      expect{ Diggy(42) }.to raise_error(ArgumentError, "positional argument must be a hash or respond to to_h if present")
    end
  end
end
#  SPDX-License-Identifier: Apache-2.0
