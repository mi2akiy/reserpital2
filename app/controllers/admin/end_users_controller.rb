class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
    @end_users = EndUser.all.page(params[:page])
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
  end
end
