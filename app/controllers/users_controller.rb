class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {error: '404 not found'}, status: 404
  end

  def index
    users = User.order(created_at: :desc)
    render json: {status: 'SUCCESS', message: 'Loaded posts', data: users }
  end

  def show
    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
