class Api::V1::UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find_by! email: params[:email])
  end

  def create
    user = User.create(user_params)

    if user.save
      render json: UserSerializer.new(user)
    else
      not_created
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: UserSerializer.new(user)
    else
      not_found
    end
  end

  def destroy
    render json: User.delete(params[:id])
  end


private


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :zip)
  end

  def not_found
    payload = {
      message: 'User not found',
      code: 404,
      status: 'NOT FOUND'
    }
    render json: payload, status: :not_found
  end

  def not_created
    payload = {
      message: 'User could not be created',
      code: 400,
      status: 'BAD REQUEST'
    }
    render json: payload, status: :bad_request
  end
end
