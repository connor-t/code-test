require_relative '../lib/checkout.rb'

describe 'Checkout' do
  let(:promotional_rules) { 'rules' }
  let(:co) { Checkout.new(promotional_rules) }
  let(:item) { Product.new(001, 'chair', 9.25) }
  let(:item_2) { Product.new(002, 'table', 45.0) }

  context '#scan' do
    it 'scans an item' do
      co.scan(item)
      expect(co.basket.first).to eq(item)
    end

    it 'can scan an multiple items' do
      co.scan(item)
      co.scan(item_2)
      expect(co.basket.count).to eq(2)
    end
  end

  context '#total' do
    it 'returns 0 when basket is empty' do
      expect(co.total).to eq(0)
    end

    it 'displays the checkout total when the basket has items' do
      co.scan(item)
      co.scan(item_2)
      expect(co.total).to eq(54.25)
    end
  end
end
