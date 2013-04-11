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

# infowindow     ******* Need to move this to the controller 
  def gmaps4rails_infowindow
      "<div id=\"info-inside\">
        <div id=\"info-title\">
            #{self.name}
        </div>
        <div id=\"info-content\">
            #{self.content}
        </div>
        <div id=\"info-menu\">
            <button class=\"btn btn-info\">Add to Group</button>  <button class=\"btn btn-info\">Edit</button> 
        </div>
      </div>"
  end



end


