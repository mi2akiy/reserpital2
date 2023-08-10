class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin
  
  def index
    @end_users = EndUser.all
    @end_users = EndUser.all.page(params[:page])
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end
  
  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to admin_end_user_path(params[:id])
  end
  
  private

  def authenticate_admin
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
  
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :sex, :birthday, :email, :telephone_number, :postal_code, :address)
  end
  
end
