# frozen_string_literal: true

require "spec_helper"

RSpec.describe Cart, type: :model do
  include_context "sample products"

  describe "#add" do
    it "adds a product to items with code and quantity" do
      subject.add(lavender)
      expect(subject.items).to eq({ lavender.code => { item: lavender, quantity: 1 } })
    end

    it "updates the quantity to two when adding same product" do
      subject.add(lavender)
      subject.add(lavender)
      expect(subject.items).to eq({ lavender.code => { item: lavender, quantity: 2 } })
    end
  end

  describe "#apply_discount" do
    it "updates the discounts" do
      subject.apply_discount(10)
      expect(subject.discounts).to eq(10)
    end
  end

  describe "#total" do
    before do
      subject.add(lavender)
      subject.add(lavender)
      subject.apply_discount(10)
    end

    it "returns the total after subtracting the discount" do
      expect(subject.total).to eq(8.50)
    end
  end

  describe "#find_item_by" do
    before do
      subject.add(lavender)
    end

    it "returns the item when code matches" do
      expect(subject.find_item_by(lavender.code)).to eq({ item: lavender, quantity: 1 })
    end

    it "returns the nil has when code misses" do
      expect(subject.find_item_by("hi")).to be_nil
    end
  end
end
