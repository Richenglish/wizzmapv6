class AddGroupIdToPoints < ActiveRecord::Migration
  def change
  	add_column :points, :group_id, :integer
  	add_index :points, :group_id
  end
end
