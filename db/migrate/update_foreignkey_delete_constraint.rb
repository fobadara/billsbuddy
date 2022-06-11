class UpdateForeignkeyDeleteConstraints < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :group_bills, :bills
    remove_foreign_key :group_bills, :groups
    remove_foreign_key :bills, :users
    add_foreign_key :group_bills, :bills, on_delete: :cascade
    add_foreign_key :group_bills, :groups, on_delete: :cascade
    add_foreign_key :bills, :users, on_delete: :cascade
  end
end
