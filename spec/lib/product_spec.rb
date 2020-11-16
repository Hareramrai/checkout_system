# frozen_string_literal: true

require "spec_helper"

RSpec.describe Product, type: :model do
  let(:product) { Product.new(code, name, price) }
  let(:code) { "007" }
  let(:name) { "Jeans" }

  context "with valid values" do
    let(:price) { 9.25 }

    describe "#code" do
      it "returns assigned code" do
        expect(product.code).to eq(code)
      end
    end

    describe "#name" do
      it "returns assigned name" do
        expect(product.name).to eq(name)
      end
    end

    describe "#price" do
      it "returns assigned price" do
        expect(product.price).to eq(price)
      end
    end
  end

  context "with invalid values" do
    let(:price) { "abcd" }
    let(:colour) { 1234 }

    it "raise type error for incorrect field type" do
      expect do
        Product.new(code, name, price)
      end.to raise_error
    end
  end
end
