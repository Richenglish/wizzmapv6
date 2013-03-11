class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
	  t.string :group_name
	  t.string :group_description
	  t.references :user

      t.timestamps
    end

    add_index :groups, :user_id
  end
end
