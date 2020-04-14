class Cart
  def initialize
    @items = []
  end

  def add_item(item_id)    
    found_item  = @items.find { |item| item.item_id == item_id }

    if found_item
      found_item.increment!
      # 因為有設定預設值所以可填可不填，增加彈性
      # found_item.increment!(5)
    else
      @items << CartItem.new(item_id)
    end
  end

  def empty?
    @items.empty?
  end

  def items 
    @items
  end

  def total
    result = @items.reduce(0) { |sum, item| sum + item.total }
    # @items.sum { |item| item.total }

    # 4/1 全館一折
    if Time.now.month == 4 and Time.now.day == 1
      result *= 0.1
    end
    return result
  end

  def to_hash
    items = [ ]
    items = @items.map { |item|
      { "item_id" => item.item_id,
        "quantity" => item.quantity }
  }
    return result = { "items" => items }
  end

end