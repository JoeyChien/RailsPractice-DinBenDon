class User < ApplicationRecord
  # 不是真的欄位，只是一個讓資料可以通過的方法  
  validates :email, presence: true, 
                    uniqueness: true
  validates :password, presence: true, 
                       confirmation: true,
                       length: {minimum: 4}
end
