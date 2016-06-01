class AddTotalNumItemsAndTotalPurchaseAmount < ActiveRecord::Migration
  def change
    add_column :receipts, :number_of_items, :integer
    add_column :receipts, :total, :integer
  end
end
