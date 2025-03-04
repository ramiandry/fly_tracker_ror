class ApplicationController < ActionController::API
  # Méthode pour autoriser les requêtes
  def authorize_request
    @current_user = user_from_token

    render json: { error: "Not Authorized" }, status: :unauthorized unless @current_user
  end

  private

  # Méthode pour décoder le JWT et trouver l'utilisateur
  def user_from_token
    header = request.headers["Authorization"]

    if header.present?
      token = header.split(" ").last
      begin
        decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
        user_id = decoded["user_id"]
        @current_user = User.find_by(id: user_id)
      rescue JWT::DecodeError => e
        nil  # Si l'authentification échoue, renvoie nil
      end
    end
  end
end
