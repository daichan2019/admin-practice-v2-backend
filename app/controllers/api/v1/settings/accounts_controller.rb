class Api::V1::Settings::AccountsController < ApplicationController
  include Firebase::Auth::Authenticable
  before_action :authenticate_user

  def update
    current_user.update(user_params)
    render :template => "api/v1/settings/accounts/index.json.jb"
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar, avatar: :data)
  end


end
