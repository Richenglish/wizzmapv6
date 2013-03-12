class PointsController < ApplicationController
  
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]

  # GET /points
  # GET /points.json
 
  
  def index
    @points = Point.all
    @json = Point.all.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @points }
    end
  end


  def list
    @points = Point.all

    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @points }
    end
  end



  # GET /points/1
  # GET /points/1.json
  def show
    @point = Point.find(params[:id])

    @json = @point.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @point }

    end
  end



  # GET /points/new
  # GET /points/new.json
  # Map Add
  def new
    @point = Point.new
    @json = @point.to_gmaps4rails

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @point }
    end
  end



  # GET /points/1/edit
  def edit
    @point = Point.find(params[:id])
  end


  # POST /points
  # POST /points.json
  def create
    @point = current_user.points.new(params[:point])

    respond_to do |format|
      if @point.save
        format.html { redirect_to @point, notice: 'Point was successfully created.' }
        format.json { render json: @point, point: :created, location: @point }
      else
        format.html { render action: "new" }
        format.json { render json: @point.errors, point: :unprocessable_entity }
      end
    end
  end


  # PUT /points/1
  # PUT /points/1.json
  def update
    @point = current_user.points.find(params[:id])
    
    if params[:point] && params[:point].has_key?(:user_id)
      params[:point].delete(user_id)
    end

    respond_to do |format|
      if @point.update_attributes(params[:point])
        format.html { redirect_to @point, notice: 'Point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @point.errors, point: :unprocessable_entity }
      end
    end
  end


  #Search
  def search
    @points = Point.search params[:search]


  end




  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    @point = Point.find(params[:id])
    @point.destroy

    respond_to do |format|
      format.html { redirect_to points_url }
      format.json { head :no_content }
    end
  end
end
