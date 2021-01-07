class GQL::Mutation < GQL::Base
  def initialize
    super
    @io << "mutation { "
  end
end
