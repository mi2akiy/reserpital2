class Admin::ClinicalDepartmentController < ApplicationController
  def index
  end

  def new
    @clinical_department = ClinicalDepartment.new(clinical_department_params)
  end
  
private

  def clinical_department_params
    params.require(:clinical_department).permit(:)
  end
  
end
