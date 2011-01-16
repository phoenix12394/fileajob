class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  

  def new
    @title = "sign up"
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
    @microposts = @user.microposts.paginate(:page => params[:page])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = 'welcome to fake twitter!'
      redirect_to @user
    else
      @title = "sign up"
      render 'new'  
      
    end
  end
  
  def edit
    @title = "Edit user"
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "profile updated."
      redirect_to @user
    else
      @title = "edit user"
      render 'edit'
    end
  end
  
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "user destroyed"
    redirect_to users_path
  end
  
  def following
    @title = "following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  
  private
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
