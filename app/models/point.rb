class Point < ActiveRecord::Base
  attr_accessible :content, :lat, :long, :name, :user_id, :group_id

  belongs_to :user
  belongs_to :group

  acts_as_gmappable :process_geocoding => false, :lat => "lat", :lng => "long"

  validates :content, presence: true,
  						length: { minimum: 2 }

  validates :user_id, presence: true

# For Search

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['name LIKE ? OR content LIKE ?', search_condition, search_condition])
  end

# infowindow     ******* Need to move this to the controller 
  def gmaps4rails_infowindow
      "<h4>#{self.name}</h4><br />
      #{self.content} <br /><br />
      <button class=\"btn btn-info\">Add to Group</button>"

  end



end


