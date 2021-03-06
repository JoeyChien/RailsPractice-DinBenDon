class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, 
                    numericality: { greater_than: 0 }
  belongs_to :category
  
  has_one_attached :cover

  # 呼叫才會使用
  # scope :available, -> { where(deleted_at: nil) }
  # 跟上面同樣功能，建議多做多行的時候再用
  # def self.available
  #   where(id: 2)
  # end

  # 所有查詢都會自動套用
  default_scope { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.now)
  end
end
