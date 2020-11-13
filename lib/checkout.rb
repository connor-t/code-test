class Checkout
  attr_accessor :basket

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @basket = []
    @total = 0
  end

  def scan(item)
    @basket << item
  end

  def total
    @basket.sum(&:price)
  end
end