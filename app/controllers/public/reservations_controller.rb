class Public::ReservationsController < ApplicationController
  def new
    @hospital = Hospital.find(params[:hospital_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = current_end_user.reservations.create(hospital_id: params[:hospital_id],date:Date.today,time:Time.now)
    redirect_to public_hospital_reservationss_conmplete_path
  end

  def complete
    
  end

  def index
    @q = Board.ransack(params[:q])
    @hospitals = @q.result(distinct: true).includes(:end_user).page(params[:page]).order("created_at desc")
  end

  def show
  end

  private

 def reservation_params
    params.require(:reservation).permit(:date, :time, :hospital_id)
 end
end
