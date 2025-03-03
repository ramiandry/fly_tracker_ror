class Historique < ApplicationRecord
  belongs_to :aircraft
  belongs_to :user

  # Validations (facultatif)
  validates :action, presence: true
  validates :timestamp, presence: true
end
