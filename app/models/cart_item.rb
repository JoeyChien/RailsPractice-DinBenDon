class CartItem
  # 實體變數只能存在class中，為了讓外部可以直接拿取  
  attr_reader :item_id, :quantity
  def initialize(item_id, quantity = 1)
    @item_id = item_id
    @quantity = quantity  
  end
  def increment!(amount)
    @quantity += amount
  end
end