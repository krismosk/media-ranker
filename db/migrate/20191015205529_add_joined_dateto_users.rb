class AddJoinedDatetoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :joined_date, :datetime
  end
end
