class GQL::Interface < GQL::Base
  def initialize(name, implements)
    super()
    @io << "interface #{name} #{implements.join(" & ")} { "
  end
end
