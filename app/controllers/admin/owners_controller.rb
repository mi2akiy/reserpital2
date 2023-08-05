class Admin::OwnersController < ApplicationController
  before_action :authenticate_admin

  def index
    @hospital = Hospital.find(params[:hospital_id])
    @owner = Owner.new
    @owners = @hospital.owners
  end

  def create
    @owner = Owner.new(owner_params)
    @owner.save!
    redirect_to admin_hospital_owners_path
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
     params.require(:owner).permit(:email, :name, :password, :password_confirmation, :hospital_id)
  end
end
