class UsersController < ApplicationController

	before_action :set_user, only: [:profile, :update,:index]

  def index
  end


  def profile
  	
  end

  def show
  	@user = User.find(params[:id])
  end


  def update
  	@user.update_without_password(user_params)
  	redirect_to request.referer
  end


  def following   
    @user  = User.find(params[:id])
    # @following = @user.following.paginate(page: params[:page])   
    @users = @user.following
  end

  def followers   
    @user  = User.find(params[:id])
    @users = @user.followers
    # @followers = @user.followers.paginate(page: params[:page])    
  end

  private

  def set_user
  	@user = User.find(current_user.id)
  end

   def user_params
      params.require(:user).permit(:first_name,:last_name,:gender,:tag,:dob,:email,:password,:password_confirmation)
    end
    
end
