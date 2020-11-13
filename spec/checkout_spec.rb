describe 'Checkout' do
  let(:co) { Checkout.new(promotional_rules) }

  context '#scan' do
    it 'scans an item' do
      co.scan(item)
      expect(co.items.first).to eq(item)
    end
  end

  context '#total' do
    it 'displays the checkout total' do
      co.scan(item)
      expect(co.total).to eq item.price
    end
  end
end
