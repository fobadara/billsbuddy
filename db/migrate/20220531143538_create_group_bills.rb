class CreateGroupBills < ActiveRecord::Migration[7.0]
  def change
    create_table :group_bills do |t|
      t.belongs_to :group, null: false, foreign_key: true
      t.belongs_to :bill, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
