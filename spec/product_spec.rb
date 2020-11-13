require_relative '../lib/product.rb'

describe 'Product' do
  let(:product) { Product.new(001, 'chair', 9.99) }

  it 'has accessible attributes' do
    expect(product.code).to eq(001)
    expect(product.name).to eq('chair')
    expect(product.price).to eq(9.99)
  end
end
