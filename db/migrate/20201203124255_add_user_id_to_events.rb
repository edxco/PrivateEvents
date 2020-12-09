class AddUserIdToEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :creator
    add_reference :events, :user
  end
end
