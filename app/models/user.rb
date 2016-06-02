class User < ActiveRecord::Base

  has_many :receipts
  has_many :stores, through: :receipts
  has_many :items, through: :receipts

  has_secure_password

end