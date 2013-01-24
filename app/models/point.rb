class Point < ActiveRecord::Base
  attr_accessible :content, :lat, :long, :name, :user_id

  belongs_to :user

  acts_as_gmappable :process_geocoding => false, :lat => "lat", :lng => "long"

end


