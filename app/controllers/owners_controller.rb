class OwnersController < ApplicationController
  before_action :authenticate_admin!
  def index
    authenticate_admin!
    @owners = owner.joins(:hospital).all
  end

  def new 
    authenticate_admin!
    @owner = owner.new
  end

  def create 
    authenticate_admin!
    owner.create!(owner_params)
    redirect_to owners_path
  end

  def show
    authenticate_owner!
    @owner = current_owner
  end

  private
  def owner_params
    params.require(:owner).permit(:name, :password, :email, :hospital_id)
  end
end
