# frozen_string_literal: true

class Cart
  attr_reader :items, :discounts

  def initialize
    @items = {}
    @discounts = 0
  end

  def add(item)
    @items[item.code] = if @items.key?(item.code)
      { item: item, quantity: @items.dig(item.code, :quantity) + 1 }
    else
      { item: item, quantity: 1 }
    end
  end

  def apply_discount(amount)
    @discounts += amount
  end

  def total
    items.sum { |_, item| item[:item].price * item[:quantity] } - discounts
  end

  def find_item_by(product_code)
    items[product_code]
  end
end
