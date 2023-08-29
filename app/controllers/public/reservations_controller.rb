class Public::ReservationsController < ApplicationController
  before_action :authenticate_end_user

  def create
     @reservation = current_end_user.reservations.new(hospital_id: params[:hospital_id],date:Date.today,time:Time.now)
     @reservation.end_user = current_end_user
     if @reservation.save
      redirect_to public_hospital_reservations_conmplete_path
     else
      @hospital = Hospital.find(params[:hospital_id])
      render template: 'public/hospitals/show'
     end
  end

  def complete
    @hospital = Hospital.find(params[:hospital_id])
  end

  def cancel
    @reservation = Reservation.find(params[:id])
    @reservation.status = "cancel"
    @reservation.save
    redirect_to reserved_hospitals_public_end_users_path
  end

  # def show
  #   @hospital = Hospital.find(params[:hospital_id])
  # end


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
