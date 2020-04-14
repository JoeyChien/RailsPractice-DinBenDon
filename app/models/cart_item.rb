class CartItem
  # 實體變數只能存在class中，為了讓外部可以直接拿取  
  attr_reader :item_id, :quantity
  
  def initialize(item_id, quantity = 1)
    @item_id = item_id
    @quantity = quantity  
  end

  def increment!(amount = 1)
    # @quantity不可拿掉@，因為在等號左邊會是變數
    @quantity += amount
  end

  def item
    # @item_id 拿掉@會變成方法
    Item.find(item_id)
  end

  def total
    item.price * quantity
  end
end