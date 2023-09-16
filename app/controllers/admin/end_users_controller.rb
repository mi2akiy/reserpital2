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

  def unsubscribe
    @end_user = EndUser.find(params[:end_user_id])
  end

  def withdrawal
    @end_user = EndUser.find(params[:end_user_id])
    @end_user.update(is_deleted: true)
    flash[:notice] = '退会処理を実行いたしました'
    redirect_to admin_end_users_path
  end

  private

  def authenticate_admin
    return if admin_signed_in?

    redirect_to new_admin_session_path
  end

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :sex, :birthday,
                                     :email, :telephone_number, :postal_code, :address)
  end
end
