class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :date
      t.integer :user_id
      t.integer :store_id
      t.integer :number_of_items
      t.integer :total
    end
  end
end
