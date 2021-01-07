class GQL::Type < GQL::Base
  def initialize(name, *implements)
    super()
    @io << "type #{name} "
    @io << implements.join(" & ") if implements
    @io << " { "
  end
end
