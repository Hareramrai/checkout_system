# frozen_string_literal: true

module Promotions
  class CartPromotion
    extend Dry::Initializer

    param :threshold_amount, Types::Coercible::Integer
    param :discount_percentage, Types::Coercible::Float

    def apply_promotion(cart)
      cart_total = cart.total

      return if cart_total < threshold_amount

      discounted_price = discount_percentage * cart_total / 100.0
      cart.apply_discount(discounted_price)
    end
  end
end
