class GQL::Union < GQL::Base
  def initialize(name, types)
    super()
    @io << "union #{name} = #{types.join(" | ")}"
  end
end
