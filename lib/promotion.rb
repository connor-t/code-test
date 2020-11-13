# The RULES constant can contain a different discount rule for each product
# e.g 'product code' => 
# {amount: 'n.o of products at the discount applies', price: 'discounted price }
# 
class Promotion
  RULES = {
    '001' => { amount: 2, price: 8.50 },
    total_spend: { amount: 60, discount: 10 }
  }.freeze

  def self.get_rules
    RULES
  end
end
