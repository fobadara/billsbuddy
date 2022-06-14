class AddRefferenceToGroup < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :bill, foreign_key: true
    add_reference :groups, :user, foreign_key: true
  end
end
