class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_profile_name(params[:id])
  	if @user
  		@points = @user.points.all
      @groups = @user.groups.all
  		
  	# gmaps4rails code

  		@json = @user.points.all.to_gmaps4rails

  		respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @points }
      	end
	# END of code snippet


		#render action: :show  # <-- This is the old code

  	else
  	  	render file: 'public/404', status: 404, formats: [:html]
  	end
  end
end
