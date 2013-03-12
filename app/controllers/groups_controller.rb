class GroupsController < ApplicationController
  
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]

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

  	respond_to do |format|
  		format.html
  		format.json { render :json => @group}
  	end
  end


  def edit
  	@group = Group.find(params[:id])
  end

  def destroy
  	@group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content}
    end
  end


end







