class UsersController < ApplicationController

  def index
    users = User.all.order(:id)
    render json: users
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
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
    user.first_name = params["first_name"] || user.first_name
    user.last_name = params["last_name"] || user.last_name
    user.email = params["email"] || user.email
    user.password = params["password"] || user.password
    user.password_confirmation = params["password_confirmation"] || user.password_confirmation
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
