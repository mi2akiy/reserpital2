class Admin::ClinicalDepartmentsController < ApplicationController
  def index
    @clinical_departments = ClinicalDepartment.all
  end

  def new
    @clinical_department = ClinicalDepartment.new
  end

  def create
    @clinical_department = ClinicalDepartment.new(clinical_department_params)
    if @clinical_department.save
      redirect_to admin_clinical_departments_path
    else @clinical_departments = ClinicalDepartment.all
      render :new
    end
  end
  
  def destroy
    @clinical_department = ClinicalDepartment.find(params[:id])
    @clinical_department.destroy
    redirect_to admin_clinical_departments_path
  end

private

  def clinical_department_params
    params.require(:clinical_department).permit(:name)
  end

end
