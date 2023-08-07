class Owner::OwnersController < ApplicationController
  def index
    @owner = Owner.new
    @owners = Owner.joins(:hospital).all
    @hospital = Hospital.find(current_owner.hospital.id)
    # @hospital = Hospital.find(params[:hospital_id])
    # @owners = Owner.all
  end
  
  def create
    @owner = Owner.new(owner_params)
    @owner.hospital_id = current_owner.hospital.id
    @owner.save!
    redirect_to owner_owners_path
  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
    redirect_to  owner_owners_path
  end
  
  private
  
  def owner_params
     params.require(:owner).permit(:email, :name, :password, :password_confirmation, :hospital_id)
  end
end
