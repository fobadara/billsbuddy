class AddGroupRefferenceToBill < ActiveRecord::Migration[7.0]
  def change
    add_reference :bills, :group, foreign_key: true
  end
end
