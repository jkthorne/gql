require "../spec_helper"

describe GQL::Type do
  it "basic type" do
    GQL.type(:Bow) do |t| 
      t.brand
      t.length
      t.axel_to_axel
    end.should eq(
      "type Bow  {  brand length axel_to_axel }"
    )
  end

  it "advanced type" do
    GQL.type(:Bow, :Compound, :Recurve) do |t| 
      t.brand
      t.length
      t.axel_to_axel
    end.should eq(
      "type Bow Compound & Recurve {  brand length axel_to_axel }"
    )
  end
end
