class Owner::ReservationsController < ApplicationController
  def index
    @reservations = current_owner.hospital.reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.assign_attributes(reservation_params)
    if @reservation.save(context: :skip_end_user_has_no_pending_appointments)
      redirect_to owner_reservations_path
    else
      render :show
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status)
  end
end
