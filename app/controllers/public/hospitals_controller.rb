class Public::HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
    @hospitals = Hospital.all.page(params[:page]).per(10)

    @q = Hospital.ransack(params[:q])
    @hospitals = @q.result(distinct: true).includes(:clinical_departments).page(params[:page]).order('created_at desc')
    return unless @q_header

    @hospitals = @q_header.result(distinct: true).includes(:clinical_departments).page(params[:page]).order('created_at desc')
  end

  def show
    @hospital = Hospital.find(params[:id])
  end
end
