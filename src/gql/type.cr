class GQL::Type < GQL::Base
  def initialize(name, implements)
    super()
    @io = "type #{name} #{implements.join(" & ")} { "
  end
end
