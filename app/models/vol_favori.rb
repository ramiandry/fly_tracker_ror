class VolFavori < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  # Ajouter des validations (si nécessaire)
  validates :user_id, presence: true
  validates :flight_id, presence: true
end
