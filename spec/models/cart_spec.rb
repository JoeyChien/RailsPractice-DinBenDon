require 'rails_helper'

RSpec.describe Cart, type: :model do

  let(:cart) { Cart.new }
  
  describe "基本功能" do 

    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      # Arrange

      # Act
      cart.add_item(1)

      # Assert
      # 自.empty?轉乘be_empty
      expect(cart).not_to be_empty
      # expect(cart.empty?).to be false      
    end

    it "如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變。" do
      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }
      2.times { cart.add_item(1) }

      expect(cart.items.count).to be 2
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      i1 = create(:item)
      i2 = create(:item)

      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }

      expect(cart.items.first.item).to be_an Item
      expect(cart.items.first.item.price).to be i1.price
    end    
    
    it "可以計算整台購物車的總消費金額" do
      i1 = create(:item, price: 50)
      i2 = create(:item, price: 100)
  
      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }

      expect(cart.total).to be 350
    end

    it "特別活動可能可搭配折扣" do
      # 4/1 全館一折
      i1 = create(:item, price: 50)
      i2 = create(:item, price: 100)
  
      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }

      t = Time.local(2008, 4, 1, 10, 5, 0)
      Timecop.travel(t)

      expect(cart.total).to eq 35
    end

  end

  describe "進階功能" do
    it "可以將購物車內容轉換成 Hash，存到 Session 裡" do
      i1 = create(:item, price: 50)
      i2 = create(:item, price: 100)
  
      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }

      expect(cart.to_hash).to eq cart_hash
    end
    
    it "Hash還原成購物車的內容" do
      
      # 注意from_hash直接作用在類別是類別方法
      cart = Cart.from_hash(cart_hash)

      expect(cart.items.count).to be 2
    end
  end

  private
  def cart_hash
    {
        "items" => [
          { "item_id" => 1, "quantity" => 3 },
          { "item_id" => 2, "quantity" => 2 }
        ]
      }
  end

end
