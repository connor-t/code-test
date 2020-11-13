class Checkout
  attr_accessor :basket

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @basket = {}
    @total = 0
  end

  def scan(item)
    if @basket[item.code]
      @basket[item.code][:count] += 1
    else
      @basket[item.code] = { count: 1, line_price: item.price }
    end
  end

  def total
    return 0 if @basket.empty?
    
    discount_products
    sum_items
    @total
  end

  def discount_products
    @basket.each do |product, values|
      if @promotional_rules.key?(product) && values[:count] >= @promotional_rules.dig(product, :amount)
        values[:line_price] = @promotional_rules.dig(product, :price)
      end
    end
  end

  def sum_items
    @basket.each { |_,item| @total += item[:count] * item[:line_price] }
  end
end
