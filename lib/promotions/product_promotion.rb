# frozen_string_literal: true

module Promotions
  class ProductPromotion
    extend Dry::Initializer
    param :product_code, Types::String
    param :threshold_quantity, Types::Coercible::Integer
    param :discount_price, Types::Coercible::Float

    def apply_promotion(cart)
      cart_item = cart.find_item_by(product_code)
      return if cart_item.empty? || cart_item[:quantity] < threshold_quantity

      discounted_price = (cart_item[:item].price - discount_price) * cart_item[:quantity]
      cart.apply_discount(discounted_price)
    end
  end
end
