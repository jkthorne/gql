require "../spec_helper"

describe GQL::Query do
  it "basic query" do
    GQL.query{|q| q.bows }.should eq("query {  bows }")
  end
end
