class GQL::Enum < GQL::Base
  def initialize(name, *consts)
    super()
    @io << "enum #{name} { #{consts.first.join(" ")}"
  end
end
