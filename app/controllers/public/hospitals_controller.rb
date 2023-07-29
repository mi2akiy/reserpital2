class Public::HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
    @hospitals = Hospital.all.page(params[:page]).per(10)
  end

  def show
    @hospital = Hospital.find(params[:id])
  end
end
