class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :name
      t.text :content
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
