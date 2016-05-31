class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :date
    end
  end
end
