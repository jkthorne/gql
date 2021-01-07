class GQL::Extend < GQL::Base
  def initialize(klass, type)
    super
    @io << "extend #{flass} #{type} { "
  end
end
