require "./spec_helper"

GQL.register(register_spec) do |gql|
  gql.exampleBlock do
    gql.exampleField
  end
end

describe GQL do
  it "basic macro" do
    GQL.query do |q|
      q.register_spec! 
    end.should eq(
      "query {  exampleBlock {  exampleField } }"
    )
  end

  it "macro inside block" do
    GQL.query do |q|
      q.outter do
        q.inner
        q.register_spec!
      end
    end.should eq(
      "query {  outter {  inner exampleBlock {  exampleField } } }"
    )
  end
end
