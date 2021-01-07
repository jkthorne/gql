class GQL::Interface < GQL::Base
  def initialize(name, *implements)
    super()
    @io << "interface #{name} "
    @io << implements.join(" & ") if implements
    @io << " { "
  end
end
