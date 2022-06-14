class DropBillsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :bills
  end
end
