class Admin::ClinicalDepartmentsController < ApplicationController
  
  def new
    @temporary_departments = TemporaryDepartment.all
    @clinical_department = ClinicalDepartment.new
  end
  
  def create
    @clinical_department = ClinicalDepartment.new(clinical_department_params)
    @clinical_department.save
    redirect_to new_admin_hospital_path
  end

  private

  def clinical_department_params
    params.require(:clinical_department).permit(:temporary_department_id)
  end
end
