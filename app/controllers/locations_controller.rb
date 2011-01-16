class LocationsController < ApplicationController
  def new
    @title = "new location"
    @location = Location.new
  end

  def index
    @title = "all locations"
    @locations = Location.paginate(:page => params[:page])
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      flash[:success] = 'location created!'
      redirect_to @location
    else
      @title = "new location"
      render 'new'
    end
  end

  def show
    @location = Location.find(params[:id])
    @title = @location.name
    @microposts = @location.microposts.paginate(:page => params[:page])

  end
end
