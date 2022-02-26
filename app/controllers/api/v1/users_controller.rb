class Api::V1::UsersController < ApplicationController

  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find_by email: params[:email])
  end
end