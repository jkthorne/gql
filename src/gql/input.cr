class GQL::Input < GQL::Base
  def initialize(name)
    super
    @io << "input #{name} { "
  end
end
