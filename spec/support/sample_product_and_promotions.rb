# frozen_string_literal: true

RSpec.shared_context "sample products" do
  let(:lavender) { Product.new("001", "Lavender heart", 9.25) }
  let(:cufflinks) { Product.new("002", "Personalised cufflinks", 45.00) }
  let(:t_shirt) { Product.new("003", "Kids T-shirt", 19.95) }
end

RSpec.shared_context "sample promotions" do
  let(:product_promotion) { Promotions::ProductPromotion.new("001", 2, 8.5) }
  let(:cart_promotion) { Promotions::CartPromotion.new(60, 10) }
end
