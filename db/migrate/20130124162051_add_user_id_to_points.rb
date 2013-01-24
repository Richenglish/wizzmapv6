class AddUserIdToPoints < ActiveRecord::Migration
  def change
  	add_column :points, :user_id, :integer
  	add_index :points, :user_id
  end
end
