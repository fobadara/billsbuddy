class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :name
      t.integer :amount
      t.text :description
      t.date :due_date

      t.timestamps
    end
  end
end
