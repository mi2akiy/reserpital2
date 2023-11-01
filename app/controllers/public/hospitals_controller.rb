class Public::HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all.page(params[:page]).per(5)
  
    @q = Hospital.ransack(params[:q])
    @hospitals = @q.result(distinct: true).includes(:clinical_departments).page(params[:page]).order('created_at desc')
  end

  def show
    @hospital = Hospital.find(params[:id])
  end
end
