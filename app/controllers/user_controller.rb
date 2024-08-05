class UsersController < ApplicationController

  def index
    users = User.all.order(:id)
    render json: users
  end

  def create
    user = User.new(
      user_name: params[:user_name],
      first_name: params[:first_name],
      last_name: params[:last_name],
      position: params[:position],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    id = params[:id]
    user = User.find_by(id: id)
    user.user_name = params["user_name"] || user.user_name
    user.first_name = params["first_name"] || user.first_name
    user.last_name = params["last_name"] || user.last_name
    user.position = params["position"] || user.position
    user.password_digest = params["password_digest"] || user.password_digest
    if user.save #happy path
      render json: user
    else #sad path
      render json: {error_messages: user.errors.full_messages}, status: 422
    end
  end

  def destroy
    user_id = params["id"]
    user = User.find_by(id: User_id)
    user.destroy
    render json: {message: "User has been deleted!"}
  end

end
