# frozen_string_literal: true

module Types
  include Dry.Types()
end

class Product
  extend Dry::Initializer
  param :code, Types::String
  param :name, Types::String
  param :price, Types::Coercible::Float
end
