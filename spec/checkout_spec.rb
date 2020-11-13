require_relative '../lib/checkout.rb'

describe 'Checkout' do
  let(:promotional_rules) { 'rules' }
  let(:co) { Checkout.new(promotional_rules) }
  let(:item) { 'item' }

  context '#scan' do
    it 'scans an item' do
      co.scan(item)
      expect(co.basket.first).to eq(item)
    end
  end

  context '#total' do
    it 'displays the checkout total' do
      co.scan(item)
      expect(co.total).to eq item.price
    end
  end
end
