class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def create
    @micropost = current_user.microposts.build(params[:micropost])
  logger.debug "The object is #{params[:micropost]}"
    if @micropost.save
      flash[:success] = 'Micropost created!'
      redirect_to root_path
    else
      @feed_items = []
      renter 'pages/home'
    end
  end
  
  def new
    @title = "new post"
    @micropost = Micropost.new
  end
  
  def destroy
    @micropost.destroy
    redirect_back_or root_path
  end
  
  def show
    @micropost = Micropost.find(params[:id])
    @title = @micropost.title
  end
  
  private
    def authorized_user
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user?(@micropost.user)
    end
end