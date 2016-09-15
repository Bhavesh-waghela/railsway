class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def search_users
    @users = User.where('name LIKE ?', "%#{params[:name]}%")
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
    redirect_to root_path
  end

  def create
    @user = User.create(user_params)

    respond_to do |format|
      format.html {redirect_to root_path }
      format.json { render :json }
    end 
  end

  def show_profile
    @user = User.find_by_username(params[:username])
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_path, :notice => "User updated."
    else
      redirect_to root_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path, :notice => "User deleted."
  end

  def user_start
  end
  private

  def admin_only
    unless current_user.admin?
      #redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end
  def user_params
    params.require(:user).permit(:name , :username)
  end
end
