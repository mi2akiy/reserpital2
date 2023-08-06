class Owner::HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end
  
  def update
    @hospital = Hospital.find(params[:id])
    if @hospital.update(hospital_params)
      redirect_to owner_hospital_path(@hospital)
    else
      @hospital = Hospital.find(params[:id])
      render :edit
    end
  end
  
  private
  
  def hospital_params
     params.require(:hospital).permit(:hospital_image, :name, :telephone_number, :postal_code, :address, :am_start_time, :am_end_time, :pm_start_time, :pm_end_time, :monday_am, :monday_pm, :tuesday_am, :tuesday_pm, :wednesday_am, :wednesday_pm, :thursday_am, :thursday_pm, :friday_am, :friday_pm, :saturday_am, :saturday_pm, :sunday_am, :sunday_pm, :holiday_am, :holiday_pm, :home_page, clinical_department_ids: [])
  end
end
