class Admin::ClinicalDepartmentsController < ApplicationController
  before_action :authenticate_admin

  def index
    @clinical_departments = ClinicalDepartment.all
    @clinical_department = ClinicalDepartment.new
  end

  def create
    @clinical_department = ClinicalDepartment.new(clinical_department_params)

    @clinical_department.save
    redirect_to  admin_clinical_departments_path
  end

  def destroy
    @clinical_department = ClinicalDepartment.find(params[:id])
    @clinical_department.destroy
    redirect_to admin_clinical_departments_path
  end

  private

  def authenticate_admin
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

  def clinical_department_params
    params.require(:clinical_department).permit(:name)
  end
end
