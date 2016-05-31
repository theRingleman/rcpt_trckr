class User < ActiveRecord::Base

  has_many :items
  has_many :receipts
  has_many :user_stores
  has_many :stores, through: :user_store

  has_secure_password

end