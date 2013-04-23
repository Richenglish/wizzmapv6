class Point < ActiveRecord::Base
  attr_accessible :content, :lat, :long, :name, :user_id, :group_ids

  belongs_to :user
  has_and_belongs_to_many :groups

  acts_as_gmappable :process_geocoding => false, :lat => "lat", :lng => "long"

  validates :content, presence: true,
  						length: { minimum: 2 }

  validates :user_id, presence: true

# For Search

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['name LIKE ? OR content LIKE ?', search_condition, search_condition])
  end





end


