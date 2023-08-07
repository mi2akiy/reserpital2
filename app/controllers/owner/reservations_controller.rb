class Owner::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(hospital_id: params[:hospital_id])
  end

  def edit
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to owner_end_user_path(@reservation.end_user.id)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status)
  end

end
