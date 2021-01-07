class GQL::Extend < GQL::Base
  def initialize(klass, type)
    super()
    @io << "extend #{klass} #{type} { "
  end
end
