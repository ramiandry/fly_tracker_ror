class User < ApplicationRecord
  has_secure_password  # Cela permet de sécuriser le mot de passe et ajoute les méthodes 'password' et 'password_confirmation'

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
