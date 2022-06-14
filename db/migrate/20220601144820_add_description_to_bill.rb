class AddDescriptionToBill < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :description, :text
  end
end
