class Promotion
  RULES = {
    '001' => { amount: 2, price: 8.50 }
  }.freeze

  def self.get_rules
    RULES
  end
end
