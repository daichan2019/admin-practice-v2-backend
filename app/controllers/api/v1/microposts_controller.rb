class Api::V1::MicropostsController < ApplicationController
  include Firebase::Auth::Authenticable
  before_action :authenticate_user, only: %i[create update destroy]

  def index
    @microposts = Micropost.includes(:user).order(created_at: :desc)
    render :template => "api/v1/microposts/index.json.jb"
  end

  def create
    @micropost = current_user.microposts.create!(micropost_params)
    render :template => "api/v1/microposts/show.json.jb"
  end

  def show
    @micropost = Micropost.find(params[:id])
    render :template => "api/v1/microposts/show.json.jb"
  end

  def update
    @micropost = current_user.microposts.find(params[:id])
    @micropost.update!(micropost_params)
    render :template => "api/v1/microposts/show.json.jb"
  end

  def destroy
    @micropost = current_user.microposts.find(params[:id])
    @micropost.destroy!
    render :template => "api/v1/microposts/show.json.jb"
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
