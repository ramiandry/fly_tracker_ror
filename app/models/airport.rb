require "csv"
class Airport < ApplicationRecord
  # Ajout des validations (si nécessaire)
  validates :ident, presence: true, uniqueness: true
  validates :name, presence: true

  def self.import_csv(file)
    CSV.foreach(file.path, headers: true) do |row|
      # Nettoyer les clés et les valeurs si nécessaire
      airport_data = row.to_hash.transform_keys do |key|
        key.is_a?(String) ? key.delete("'") : key
      end

      # Nettoyer les valeurs (enlever les guillemets simples autour des valeurs)
      airport_data.transform_values! do |value|
        if value.is_a?(String)
          value.delete("'")  # Enlève les guillemets simples
        else
          value  # Si ce n'est pas une chaîne, retourne la valeur sans modification
        end
      end
      airport_data.reject! { |key, value| key.blank? }
      # Créer un enregistrement dans la base de données
      begin
        Airport.create!(airport_data)
      rescue => e
        # Si une erreur survient lors de l'importation d'une ligne
        puts "Error importing row: #{e.message}"
      end
    end
  end
end
