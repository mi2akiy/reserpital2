class Owner::ReservationsController < ApplicationController
  def index
    @reservations = current_owner.hospital.reservations
  end
  def show
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to owner_reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status)
  end

end
