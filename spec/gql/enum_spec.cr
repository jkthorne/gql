require "../spec_helper"

describe GQL::Enum do
  it "basic enum" do
    GQL.enum(
      "MANUFACTURER", "Bowtech", "Hoyt", "Mathews"
    ).should eq(
      "enum MANUFACTURER { Bowtech Hoyt Mathews }"
    )
  end
end
