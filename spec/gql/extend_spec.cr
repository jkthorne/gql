require "../spec_helper"

describe GQL::Extend do
  it "basic extend" do
    GQL.extend(:type, :Manufacturer) { |e|
      e.owner :Person
      e.location :String
    }.should eq(
      "extend type Manufacturer {  owner: Person location: String }"
    )
  end
end
