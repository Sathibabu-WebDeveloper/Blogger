class UserDashboardsController < ApplicationController
  def index
  end


  def profile
  	@user = User.find(current_user.id)
  end
  
end
