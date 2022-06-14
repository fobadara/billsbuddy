class AddCategoryToBill < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :category, :string
  end
end
