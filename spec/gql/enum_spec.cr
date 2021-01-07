require "../spec_helper"

describe GQL::Query do
  it "basic query" do
    GQL.enum("MANUFACTURER", "Bowtech", "Hoyt", "Mathews").should eq("enum MANUFACTURER { Bowtech Hoyt Mathews }")
  end
end
