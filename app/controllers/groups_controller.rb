class GroupsController < ApplicationController
  
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
  before_filter :authorize, only: [:edit, :update]

  def index
  	@groups = Group.all

  	respond_to do |format|
  		format.html
  		format.json { render :json => @groups}
  	end
  end

  def new
  	@group = Group.new

  	respond_to do |format|
  		format.html
  		format.json {render json: @group }
  	end
  end

  def create
  	@group = current_user.groups.new(params[:group])

  	respond_to do |format|
  		if  @group.save
  			format.html { redirect_to @group, notice: 'Group was successfuly created.' }
  			format.json { render :json => @group, group: :created, location: @group }
  		else
  			format.html { render :action => "new" }
  			format.json { render :json => @group.errors, group: :unprocessable_entity }
  		end
  	end
  end


  

  def show
    @group = Group.find(params[:id])
    @points = @group.points.all

    @menu_group = true

    @json = @group.points.all.to_gmaps4rails do |point, marker|
      marker.infowindow render_to_string(:partial => "/points/infowindow", :locals => { :point => point})
    end
  end

  def edit
  	@group = Group.find(params[:id])
  end

  def update
    @group = current_user.groups.find(params[:id])
    
    if params[:group] && params[:group].has_key?(:user_id)
      params[:group].delete(user_id)
    end

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, point: :unprocessable_entity }
      end
    end
  end



  def destroy
  	@group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content}
    end
  end

  private
  def authorize()

      s = Group.find(params[:id])

      if current_user.id == s.user.id
        
      else
          flash[:error] = "You must be owner to edit"
          redirect_to(:back)
      end
     end


end







