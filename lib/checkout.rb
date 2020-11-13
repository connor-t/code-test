class Checkout
  attr_accessor :basket, :total

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @basket = {}
    @total = 0
  end

  # store the item price with the basket so the discounted price can be used
  # where applicable
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
    discount_total if has_discount_for_total?
    @total.round(2)
  end

  def discount_products
    @basket.each do |product, values|
      if @promotional_rules.key?(product) && values[:count] >= @promotional_rules.dig(product, :amount)
        # update the line_price with the discounted price
        values[:line_price] = @promotional_rules.dig(product, :price)
      end
    end
  end

  def sum_items
    @basket.each { |_, item| @total += item[:count] * item[:line_price] }
  end

  def has_discount_for_total?
    @promotional_rules.key?(:total_spend) &&  @total > @promotional_rules[:total_spend][:amount]
  end

  def discount_total
    @total -= @total * (@promotional_rules[:total_spend][:discount]/100.0)
  end
end
