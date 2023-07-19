class Admin::TemporaryDepartmentsController < ApplicationController
  def index
    @temporary_departments = TemporaryDepartment.all
    @temporary_department = TemporaryDepartment.new    
  end

  def create
    @temporary_department = TemporaryDepartment.new(temporary_department_params)
    if @temporary_department.save
      redirect_to admin_temporary_departments_path
    else @temporary_departments = TemporaryDepartment.all
      render :index
    end
  end
  
  def destroy
    @temporary_department = TemporaryDepartment.find(params[:id])
    @temporary_department.destroy
    redirect_to admin_temporary_departments_path
  end

private

  def temporary_department_params
    params.require(:temporary_department).permit(:name)
  end

end
