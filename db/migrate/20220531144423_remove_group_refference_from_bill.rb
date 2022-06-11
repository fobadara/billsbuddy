class RemoveGroupRefferenceFromBill < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bills, :group, index: true
  end
end
