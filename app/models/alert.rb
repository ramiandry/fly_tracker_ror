class Alert < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  # Validation des champs
  validates :alert_type, presence: true
  validates :message, presence: true
end
