class Admin::HospitalsController < ApplicationController
  before_action :authenticate_admin

  def index
    @hospitals = Hospital.all
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
    @hospital.save
    department_ids = hospital_params[:clinical_department_ids]
    department_ids.shift
    department_ids.each do |clinical_department_id|
    @hospital.clinical_department_managers.create!(clinical_department_id: clinical_department_id.to_i )
    end
    redirect_to admin_hospital_path(@hospital)
  end

  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy
    redirect_to admin_hospitals_path
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    @hospital = Hospital.find(params[:id])
    if @hospital.update(hospital_params)
      redirect_to admin_hospital_path(@hospital)
    else
      @hospital = Hospital.find(params[:id])
      render :edit
    end
  end

private

  def authenticate_admin
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

  def hospital_params
     params.require(:hospital).permit(:hospital_image, :name, :telephone_number, :postal_code, :address, :am_start_time, :am_end_time, :pm_start_time, :pm_end_time, :monday_am, :monday_pm, :tuesday_am, :tuesday_pm, :wednesday_am, :wednesday_pm, :thursday_am, :thursday_pm, :friday_am, :friday_pm, :saturday_am, :saturday_pm, :sunday_am, :sunday_pm, :holiday_am, :holiday_pm, :home_page, clinical_department_ids: [])
  end
  # def hospital_update_params
  #   params.require(:hospital).permit(:hospital_image, :name, :clinical_department_id, :telephone_number, :postal_code, :address, :am_start_time, :am_end_time, :pm_start_time, :pm_end_time, :monday_am, :monday_pm, :tuesday_am, :tuesday_pm, :wednesday_am, :wednesday_pm, :thursday_am, :thursday_pm, :friday_am, :friday_pm, :saturday_am, :saturday_pm, :sunday_am, :sunday_pm, :holiday_am, :holiday_pm, :home_page)
  # end
end
