class UsersController < ApplicationController
  before_filter :admin_only

  def index
  	@users = User.all
  	
  	#render json: @users
  end

  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  	unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def create
  	@user = User.create(name: params[:name])

  	@user.save

  	respond_to do |format|

  		format.json { render :json }
  	end	
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(name: params[:name])
      #redirect_to users_path, :notice => "User updated."
    else
     # redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
   # redirect_to users_path, :notice => "User deleted."
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
end
