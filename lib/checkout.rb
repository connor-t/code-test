class Checkout
  attr_accessor :basket
  
  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @basket = []
  end

  def scan(item)
    @basket << item
  end

  def total
  end
end