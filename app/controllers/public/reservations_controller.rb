class Public::ReservationsController < ApplicationController
  def new
    @hospital = Hospital.find(params[:id])
    @reservation = Resarvation.new
  end
  
  def create
    @reservation = cuurent_end_user.reservations.create(reservation_params)
    redirect_to public_end_users_path(current_end_user)
  end

  def complete
  end

  def index
  end

  def show
  end
  
  private

 def reservation_params
    params.require(:reservation).permit(:date, :time, :hospital_id)
 end 
end
