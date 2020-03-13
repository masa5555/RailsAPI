class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {error: '404 not found'}, status: 404
  end

  def index
    users = User.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: users }
  end

  def show
    render json: @user
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: { status: 'SUCCESS', data: user }
    else
      render json: { status: 'ERROR', data: user.errors }
    end
  end
  
  def update
    if @user.update(post_params)
      render json: { status: 'SUCCESS', message: 'Updated the user', data: @user }
    else
      render json: { status: 'ERROR', message: 'Not updated', data: @user.errors }
    end
  end
  
  def destroy
    @user.destroy
    render json: { status: 'SUCCESS', message: 'Deleted the post', data: @user }
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
