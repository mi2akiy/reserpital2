class Owner::OwnersController < ApplicationController
  def index
    @hospital = Hospital.find(current_owner.hospital.id)
    @owner = Owner.new
    @owners = @hospital.owners
  end

  def create
    @owner = Owner.new(owner_params)
    @owner.hospital_id = current_owner.hospital.id
    if @owner.save
      redirect_to owner_owners_path
    else
      @hospital = Hospital.find(current_owner.hospital.id)
      @owners = @hospital.owners
      render :index
    end
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
