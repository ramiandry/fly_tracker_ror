class Api::V1::AuthenticationController < ApplicationController
  before_action :authorize_request, except: [ :authenticate ]

  # POST /api/v1/authenticate

  def authenticate
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password]) # Vérifie si l'email et le mot de passe sont corrects
      # Génère un JWT pour l'utilisateur
      token = encode_token({ user_id: @user.id })

      render json: { token: token }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

  private

  # Génère un token JWT
  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
