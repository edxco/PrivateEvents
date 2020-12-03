class ChangeTitleAndDescriptionFromEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :description, :date
    
    change_column :events, :date, :datetime

    add_column :events, :creator, :integer
    add_column :events, :location, :string
  end
end
