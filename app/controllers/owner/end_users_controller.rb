class Owner::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
    @owner = current_owner
    @hospital = @owner.hospital
  end
  
  def update
  end
end
