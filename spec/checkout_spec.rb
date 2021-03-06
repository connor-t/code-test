require_relative '../lib/checkout.rb'

describe 'Checkout' do
  let(:promotional_rules) do
    { '001' => { amount: 2, price: 8.50 },
      total_spend: { amount: 60, discount: 10 } }
  end
  let(:co) { Checkout.new(promotional_rules) }
  let(:item) { Product.new('001', 'chair', 9.25) }
  let(:item_2) { Product.new('002', 'table', 45.0) }

  context '#scan' do
    it 'scans an item' do
      co.scan(item)
      expect(co.basket).to eq({ '001' => { count: 1, line_price: 9.25 } })
    end

    it 'can scan an multiple items' do
      co.scan(item)
      co.scan(item_2)
      co.scan(item_2)
      expect(co.basket).to eq({
                                '001' => { count: 1, line_price: 9.25 },
                                '002' => { count: 2, line_price: 45.0 }
                              })
    end
  end

  context '#total' do
    it 'returns 0 when basket is empty' do
      expect(co.total).to eq(0)
    end

    it 'returns the checkout total when the basket has items' do
      co.scan(item)
      co.scan(item_2)
      expect(co.total).to eq(54.25)
    end
  end

  context '#discount_products' do
    it 'checks for a discount & updates line price' do
      co.scan(item)
      co.scan(item)
      expect(co.discount_products).to eq({ '001' => { count: 2, line_price: 8.50 } })
    end
  end

  context '#has_discount_for_total?' do
    it 'checks if there is a discount for the total price' do
      allow_any_instance_of(Checkout).to receive(:total_price).and_return(100)
      co.total_price = 100
      expect(co.has_discount_for_total?).to eq(true)
    end
  end

  context '#discount_total' do
    it 'applies the discount to the total' do
      allow_any_instance_of(Checkout).to receive(:total_price).and_return(100)
      co.total_price = 100
      expect(co.discount_total).to eq(90)
    end
  end
end
