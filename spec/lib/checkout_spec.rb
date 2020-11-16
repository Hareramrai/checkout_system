# frozen_string_literal: true

require "spec_helper"

RSpec.describe Checkout, type: :model do
  include_context "sample products"
  include_context "sample promotions"

  subject { described_class.new([product_promotion, cart_promotion]) }

  describe "#scan" do
    it "calls the add method on cart with product" do
      expect_any_instance_of(Cart).to receive(:add).with(lavender)
      subject.scan(lavender)
    end
  end

  describe "#total" do
    context "when cart promotion applied" do
      before do
        subject.scan(lavender)
        subject.scan(cufflinks)
        subject.scan(t_shirt)
      end

      it "provides discount of 10% based on cart value" do
        expect(subject.total).to eq(66.78)
      end
    end

    context "when product promotion applied" do
      before do
        subject.scan(lavender)
        subject.scan(t_shirt)
        subject.scan(lavender)
      end

      it "provides discount based on discounted product value" do
        expect(subject.total).to eq(36.95)
      end
    end

    context "when both product & cart promotion applied" do
      before do
        subject.scan(lavender)
        subject.scan(cufflinks)
        subject.scan(lavender)
        subject.scan(t_shirt)
      end

      it "provides discount based on both promotions" do
        expect(subject.total).to eq(73.76)
      end
    end
  end
end
