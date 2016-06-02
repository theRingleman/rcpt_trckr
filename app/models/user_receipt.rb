class UserReceipt < ActiveRecord::Base

  belongs_to :user
  belongs_to :receipt

end