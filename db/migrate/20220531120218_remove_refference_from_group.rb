class RemoveRefferenceFromGroup < ActiveRecord::Migration[7.0]
  def change
    remove_reference :groups, :bill, foreign_key: true
    remove_reference :groups, :user, foreign_key: true
  end
end
