class RemoveDueDateFromBill < ActiveRecord::Migration[7.0]
  def change
    remove_column :bills, :due_date
  end
end
