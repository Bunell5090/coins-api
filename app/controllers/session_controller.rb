class SessionsController < ApplicationController
  def create
    user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      render json: { jwt: jwt, user_name: user.user_name, user_id: user.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end