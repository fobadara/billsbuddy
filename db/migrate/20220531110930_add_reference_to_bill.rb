class AddReferenceToBill < ActiveRecord::Migration[7.0]
  def change
    add_reference :bills, :author, foreign_key: { to_table: :users }
    add_reference :bills, :groups, foreign_key: true
  end
end
