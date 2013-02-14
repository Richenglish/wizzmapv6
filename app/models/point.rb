class Point < ActiveRecord::Base
  attr_accessible :content, :lat, :long, :name, :user_id

  belongs_to :user

  acts_as_gmappable :process_geocoding => false, :lat => "lat", :lng => "long"

  validates :content, presence: true,
  						length: { minimum: 2 }

  validates :user_id, presence: true

#testing infowindow
  def gmaps4rails_infowindow
      "Hello"
  end



end


