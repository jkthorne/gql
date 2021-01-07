require "../spec_helper"

describe GQL::Interface do
  it "basic interface" do
    GQL.interface(:Bow) { |i|
      i.brand
      i.length
      i.axel_to_axel
    }.should eq(
      "interface Bow  {  brand length axel_to_axel }"
    )
  end

  it "interface with implements" do
    GQL.interface(:Bow, :Compound, :Recurve) { |i|
      i.brand
      i.length
    }.should eq(
      "interface Bow Compound & Recurve {  brand length }"
    )
  end
end
