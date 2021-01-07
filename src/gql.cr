require "./gql/base"
require "./gql/enum"
require "./gql/extend"
require "./gql/fragment"
require "./gql/input"
require "./gql/interface"
require "./gql/mutation"
require "./gql/query"
require "./gql/type"
require "./gql/union"

module GQL
  VERSION = "0.1.0"

  macro register(name, &block)
    class GQL::Base
      def {{ name.id }}!
      ->(
        {{block.args.splat}} : GQL::Base
      ) {
      	{{ yield }}
      }.call(self)
      end
    end
  end

  def self.enum(name, *consts)
    Enum.new(name, consts).build
  end

  def self.extend(klass, type)
    gql = Extend.new(klass, type)
    yield gql
    gql.build
  end

  def self.fragment(name, node)
    gql = Fragment.new(name, node)
    yield gql
    gql.build
  end

  def self.input(name)
    gql = Input.new(name)
    yield gql
    gql.build
  end

  def self.interface(name, *implements)
    gql = Interface.new(name, *implements)
    yield gql
    gql.build
  end

  def self.mutation
    gql = Mutation.new
    yield gql
    gql.build
  end

  def self.query
    gql = Query.new
    yield gql
    gql.build
  end

  def self.type(name, *implements)
    gql = Type.new(name, *implements)
    yield gql
    gql.build
  end

  def self.union(name, *types)
    Union.new(name, *types).build
  end
end
