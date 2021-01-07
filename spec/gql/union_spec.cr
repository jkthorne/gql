require "../spec_helper"

describe GQL::Union do
  it "basic union" do
    GQL.union(:UBow, :Compound, :Recurve).should eq(
      "union UBow = Compound | Recurve }"
    )
  end
end
