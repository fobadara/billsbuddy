class RemoveGroupReferrence < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bills, :groups, foreign_key: true
  end
end
