class Admin::HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end

  def new
    @hospital = Hospital.new
  end

  # def confirm
  #   @hospital = Hospital.new(hospital_params)
  #   @clinical_departments = ClinicalDepartment.all
  # end

  def create
    @hospital = Hospital.new(hospital_params)
    @hospital.save
    params[:clinical_department_ids].shift
    params[:clinical_department_ids].each do |clinical_department_id|
    @hospital.clinical_department_managers.create!(clinical_department_id: clinical_department_id )
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

  def hospital_params
     params.require(:hospital).permit(:hospital_image, :name, :clinical_department_id, :telephone_number, :postal_code, :address, :am_start_time, :am_end_time, :pm_start_time, :pm_end_time, :monday_am, :monday_pm, :tuesday_am, :tuesday_pm, :wednesday_am, :wednesday_pm, :thursday_am, :thursday_pm, :friday_am, :friday_pm, :saturday_am, :saturday_pm, :sunday_am, :sunday_pm, :holiday_am, :holiday_pm, :home_page)
  end
  # def hospital_update_params
  #   params.require(:hospital).permit(:hospital_image, :name, :clinical_department_id, :telephone_number, :postal_code, :address, :am_start_time, :am_end_time, :pm_start_time, :pm_end_time, :monday_am, :monday_pm, :tuesday_am, :tuesday_pm, :wednesday_am, :wednesday_pm, :thursday_am, :thursday_pm, :friday_am, :friday_pm, :saturday_am, :saturday_pm, :sunday_am, :sunday_pm, :holiday_am, :holiday_pm, :home_page)
  # end
end
