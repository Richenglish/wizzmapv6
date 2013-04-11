class GroupsPoints < ActiveRecord::Migration
	def change
		create_table :groups_points, :id => false do |t|
			t.integer :group_id
			t.integer :point_id

		end
	end
end
