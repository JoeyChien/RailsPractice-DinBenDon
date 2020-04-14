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
    @items.reduce(0) { |sum, item| sum + item.total }
    # @items.sum { |item| item.total }
  end
end