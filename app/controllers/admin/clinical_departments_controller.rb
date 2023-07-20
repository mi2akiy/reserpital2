class Admin::ClinicalDepartmentsController < ApplicationController
  
  
  def index
    @clinical_departments = ClinicalDepartment.all
    @clinical_department = ClinicalDepartment.new    
  end
  
  def create
    @clinical_department = ClinicalDepartment.new(clinical_department_params)

    @clinical_department.save
    redirect_to  admin_clinical_departments_path
  end

  private

  def clinical_department_params
    params.require(:clinical_department).permit(:name)
  end
end
