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
  end
  
  private

  def authenticate_admin
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
  
end
