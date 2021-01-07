class GQL::Fragment < GQL::Base
  def initialize(name, type)
    super()
    @io << "fragment #{name} on #{type} { "
  end
end
