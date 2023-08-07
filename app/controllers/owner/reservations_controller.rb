class Owner::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.joins(:hospital).all
  end
    
  def edit
  end
  
  def update
  end
end
