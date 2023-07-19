class Admin::HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end

  def new
    @hospital = Hospital.new
  end

  def confirm
    @hospital = Hospital.new(hospital_params)
    @clinical_departments = ClinicalDepartment.all
  end

  def create
    @hospital = Hospital.new(hospital_params)
    
    @hospital.save
    @temporary_departments = TemporaryDepartment.all
    @temporary_departments.each do |temporary_department|
      @clinical_department = ClinicalDepartment.new
      @clinical_department.hospital_id = @hospital.id
      @clinical_department.temporary_department_name = temporary_department.name
      end

      @hospital_detail = HospitalDetail.new
      @hospital_detail.hospital_id = @hospital.id
      @hospital_detail.name = @hospital.name
      # @hospital_detail.clinical_department_id = @hospital.clinical_department_id
      @hospital_detail.telephone_number = @hospital.telephone_number
      @hospital_detail.postal_code = @hospital.postal_code
      @hospital_detail.address = @hospital.address
      @hospital_detail.am_start_time = @hospital.am_start_time
      @hospital_detail.am_end_time = @hospital.am_end_time
      @hospital_detail.pm_start_time = @hospital.pm_start_time
      @hospital_detail.pm_end_time = @hospital.pm_end_time
      @hospital_detail.monday_am = @hospital.monday_am
      @hospital_detail.monday_pm = @hospital.monday_pm
      @hospital_detail.tuesday_am = @hospital.tuesday_am
      @hospital_detail.tuesday_pm = @hospital.tuesday_pm
      @hospital_detail.wednesday_am = @hospital.wednesday_am
      @hospital_detail.wednesday_pm = @hospital.wednesday_pm
      @hospital_detail.thursday_am = @hospital.thursday_am
      @hospital_detail.thursday_pm = @hospital.thursday_pm
      @hospital_detail.friday_am = @hospital.friday_am
      @hospital_detail.friday_pm = @hospital.friday_pm
      @hospital_detail.saturday_am = @hospital.saturday_am
      @hospital_detail.saturday_pm = @hospital.saturday_pm
      @hospital_detail.sunday_am = @hospital.sunday_am
      @hospital_detail.sunday_pm = @hospital.sunday_pm
      @hospital_detail.holiday_am = @hospital.holiday_am
      @hospital_detail.holiday_pm = @hospital.holiday_pm
      @hospital_detail.home_page = @hospital.home_page
      @hospital_detail.save
      
      @temporary_departments.destroy_all

    redirect_to admin_homes_top_path
  end

  def destroy
    @hospital = Hospital.find(params[:id])
    @clinical_departments = ClinicalDepartments.all
    @hospital.destroy
    @clinical_departments.destroy
    redirect_to admin_homes_top
  end

  def show
    @hospital_detail = HospitalDetail.find(params[:id])
  end

  def edit
  end

private

  def hospital_params
     params.require(:hospital).permit(:hospital_image, :name, :clinical_department_id, :telephone_number, :postal_code, :address, :am_start_time, :am_end_time, :pm_start_time, :pm_end_time, :monday_am, :monday_pm, :tuesday_am, :tuesday_pm, :wednesday_am, :wednesday_pm, :thursday_am, :thursday_pm, :friday_am, :friday_pm, :saturday_am, :saturday_pm, :sunday_am, :sunday_pm, :holiday_am, :holiday_pm, :home_page)
  end
end
