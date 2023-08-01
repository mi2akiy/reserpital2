class Public::ReservationsController < ApplicationController
  before_action :authenticate_end_user

  def create
    @reservation = current_end_user.reservations.create(hospital_id: params[:hospital_id],date:Date.today,time:Time.now)
    redirect_to public_hospital_reservationss_conmplete_path
  end

  def complete
    @hospital = Hospital.find(params[:hospital_id])
  end


  private
  
   def authenticate_end_user
    unless end_user_signed_in?
      redirect_to new_end_user_session_path
    end
   end

   def reservation_params
      params.require(:reservation).permit(:date, :time, :hospital_id)
   end
end
