class CreateUserReceipts < ActiveRecord::Migration
  def change
    create_table :user_receipts do |t|
      t.integer :user_id
      t.integer :receipt_id
    end
  end
end
