class Aircraft < ApplicationRecord
  # Tu peux ajouter des validations si nécessaire
  validates :registration, presence: false
  validates :model, presence: false
end
