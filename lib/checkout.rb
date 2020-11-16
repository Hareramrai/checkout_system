# frozen_string_literal: true

class Checkout
  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @cart = Cart.new
  end

  def scan(item)
    cart.add(item)
  end

  def total
    apply_promotions
    cart.total.round(2)
  end

  private

    attr_reader :promotional_rules, :cart

    def apply_promotions
      promotional_rules.map { |promotional_rule| promotional_rule.apply_promotion(cart) }
    end
end
