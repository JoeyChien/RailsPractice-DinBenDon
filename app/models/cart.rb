class Cart
  attr_reader :items
  # def items 
  #   @items
  # end

  def initialize(items = [])
    @items = items
  end

  def add_item(item_id)    
    # @items.find 由於已經透過attr_reader，可直接使用items這個方法
    found_item  = items.find { |item| item.item_id == item_id }

    if found_item
      found_item.increment!
      # 因為有設定預設值所以可填可不填，增加彈性
      # found_item.increment!(5)
    else
      # @items
      items << CartItem.new(item_id)
    end
  end

  def empty?
    # @items
    items.empty?
  end


  def total
    # @items
    result = items.reduce(0) { |sum, item| sum + item.total }
    # @items.sum { |item| item.total }

    # 4/1 全館一折
    if Time.now.month == 4 and Time.now.day == 1
      result *= 0.1
    end
    return result
  end

  def self.from_hash(hash = nil)
    if hash && hash["items"]
      items = hash["items"].map {|item| 
        CartItem.new(item["item_id"], item["quantity"])
      }
      # 等同於Cart.new(items)，因為在類別內呼叫所以可直接用new
      new(items)
    else      
      new
    end
  end

  def to_hash
    items = @items.map { |item|  
      { "item_id" => item.item_id, "quantity" => item.quantity } 
    }

    return { "items" => items }
  end

end