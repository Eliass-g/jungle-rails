require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "validates name" do
      cat1 = Category.find_or_create_by! name: 'Test'
      product = cat1.products.create!({
        name:  'Test',
        quantity: 0,
        price: 64.99
      })
      expect(product.name.present?).to eql (true)
    end
    it "validates price" do
      cat1 = Category.find_or_create_by! name: 'Test'
      product = cat1.products.create!({
        name:  'Test',
        quantity: 0,
        price: 64.99
      })
      expect(product.price.present?).to eql (true)
    end
    it "validates quantity" do
      cat1 = Category.find_or_create_by! name: 'Test'
      product = cat1.products.create!({
        name:  'Test',
        quantity: 0,
        price: 64.99
      })
      expect(product.quantity.present?).to eql (true)
    end
    it "validates cateogry" do
      cat1 = Category.find_or_create_by! name: 'Test'
      product = cat1.products.create!({
        name:  'Test',
        quantity: 0,
        price: 64.99
      })
      expect(product.category.present?).to eql (true)
    end
  end
end
