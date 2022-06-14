class AddUserRefferenceToGroup < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :user, index: true
  end
end
