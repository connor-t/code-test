require_relative '../lib/promotion.rb'

describe 'Promotion' do
  before do
    stub_const('Promotion::RULES', {discount: 50})
  end

  it 'contains the promotions rules' do
    expect(Promotion::RULES).not_to be_nil
    expect(Promotion::RULES).to eq({discount: 50})
  end

  describe '.get_rules' do
    it 'returns the promotion rules' do
      expect(Promotion.get_rules[:discount]).to eq(50)
    end
  end
end