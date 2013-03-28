class Group < ActiveRecord::Base
	belongs_to :user
	has_many :points

    attr_accessible :group_name, :group_description

    def to_label
    "#{group_name}"
  end
end
