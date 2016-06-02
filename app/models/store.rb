class Store < ActiveRecord::Base

  has_many :receipts
  has_many :users, through: :receipts

end