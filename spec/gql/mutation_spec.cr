require "../spec_helper"

describe GQL::Mutation do
  it "basic mutation" do
    GQL.mutation { |m|
      m.brand
      m.length
      m.axel_to_axel
    }.should eq(
      "mutation {  brand length axel_to_axel }"
    )
  end
end
