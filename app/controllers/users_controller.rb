class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  before_filter :logged_user, :only =>[:new, :create]
  
  def index
    @users = User.paginate(:page => params[:page])
    @title = "All users"
  end
  
  def new
    @user = User.new
    @title = 'Sign Up'
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user
    else
      @title = 'Sign Up'
      render 'new'
    end
  end
  
  def edit
    @title = 'Edit user'
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def destroy
    if current_user.id.to_s != params[:id]
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed"
      redirect_to users_path
    else
      flash[:error] = "Can't delete yourself"
      redirect_to users_path 
    end
  end
  
  def following
    @title = 'Following'
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render "show_follow"
  end
  
  def followers
    @title = 'Followers'
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render "show_follow"
  end

  private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?@user
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
  def logged_user
    redirect_to root_path if signed_in?
  end
end
