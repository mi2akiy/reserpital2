class Admin::OwnersController < ApplicationController
  before_action :authenticate_admin
  
  def index
    @owner = Owner.new
    @owners = hospital.owners
  end

  def create
    @ownre = Owner.new
    @owner.save(owner_params)
    redirect_to admin_hospital_owners_path(hospital_id)
  end

  def destroy
  end

  private
  
  def authenticate_admin
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

  def owner_params
     params.require(:owner).permit(:email, :name, :encrypted_password, :hospital_id)
  end
end
