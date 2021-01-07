require "../spec_helper"

describe GQL::Input do
  it "basic input" do
    GQL.input(:Arrow) { |i|
      i.brand
      i.length
    }.should eq(
      "input Arrow {  brand length }"
    )
  end
end
