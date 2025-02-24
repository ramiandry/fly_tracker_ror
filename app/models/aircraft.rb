require "csv"

class Aircraft < ApplicationRecord
  # Tu peux ajouter des validations si nécessaire
  validates :registration, presence: false
  validates :model, presence: false

  def self.import_csv(file)
    begin
      CSV.foreach(file.path, headers: true) do |row|
        # Convertir chaque ligne du CSV en un hash
        aircraft_data = row.to_hash.transform_keys do |key|
          # Assurer que la clé est bien une chaîne avant d'appliquer delete
          key.is_a?(String) ? key.delete("'") : key
        end

        # Nettoyer les valeurs (enlever les guillemets simples autour des valeurs)
        aircraft_data.transform_values! do |value|
          value.is_a?(String) ? value.delete("'") : value
        end

        aircraft_data.reject! { |key, value| key.blank? }

        # Vérifier si 'country' est présent et non vide
        if aircraft_data["country"].blank? || aircraft_data["model"].blank?
          # Ne pas enregistrer si 'country' est manquant ou vide
          puts "Skipping entry due to missing 'country'"
          next
        end

        # Vérifie les données avant de les enregistrer
        puts aircraft_data
        Aircraft.create!(aircraft_data)
      end
    rescue => e
      # Si un problème survient dans le CSV (par exemple, une ligne mal formatée)
      raise "Error importing CSV: #{e.message}"
    end
  end
end
