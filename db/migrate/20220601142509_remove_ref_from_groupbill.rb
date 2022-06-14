class RemoveRefFromGroupbill < ActiveRecord::Migration[7.0]
  def change
    remove_reference :group_bills, :bill, index: true, foreign_key: true
  end
end
