require_relative '../lib/checkout.rb'
require_relative '../lib/product.rb'
require_relative '../lib/promotion.rb'

describe 'Checkout' do
  let(:promotional_rules) { Promotion.get_rules }
  let(:co) { Checkout.new(promotional_rules) }
  let(:item_1) { Product.new('001', 'chair', 9.25) }
  let(:item_2) { Product.new('002', 'table', 45.0) }
  let(:item_3) { Product.new('003', 'table', 19.95) }

  it 'sums basket 1' do
    co.scan(item_1)
    co.scan(item_2)
    co.scan(item_3)

    expect(co.total).to eq(66.78)
  end

  it 'sums basket 2' do
    co.scan(item_1)
    co.scan(item_3)
    co.scan(item_1)

    expect(co.total).to eq(36.95)
  end

  it 'sums basket 3' do
    co.scan(item_1)
    co.scan(item_2)
    co.scan(item_3)
    co.scan(item_1)

    expect(co.total).to eq(73.76)
  end
end
