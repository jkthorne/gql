require "../spec_helper"

describe GQL::Fragment do
  it "basic fragment" do
    GQL.fragment(:type, :Bow) { |f|
      f.compond
      f.brand
    }.should eq(
      "fragment type on Bow {  compond brand }"
    )
  end
end
