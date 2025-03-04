module Api
  module V1
    class AirportsController < ApplicationController
      before_action :authorize_request
      # GET /api/v1/airports
      def index
        airports = Airport.all
        render json: airports
      end

      # GET /api/v1/airports/:id
      def show
        airport = Airport.find_by(id: params[:id])
        if airport
          render json: airport
        else
          render json: { error: "Airport not found" }, status: :not_found
        end
      end

      # POST /api/v1/airports
      def create
        airport = Airport.new(airport_params)
        if airport.save
          render json: airport, status: :created
        else
          render json: { errors: airport.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/airports/:id
      def update
        airport = Airport.find_by(id: params[:id])
        if airport
          if airport.update(airport_params)
            render json: airport
          else
            render json: { errors: airport.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: "Airport not found" }, status: :not_found
        end
      end

      # DELETE /api/v1/airports/:id
      def destroy
        airport = Airport.find_by(id: params[:id])
        if airport
          airport.destroy
          head :no_content
        else
          render json: { error: "Airport not found" }, status: :not_found
        end
      end

      # POST /api/v1/airports/import
      def import
        # Vérifie si un fichier a bien été soumis avec la clé 'file'
        if params[:file].present?
          begin
            # Appelle la méthode d'importation du modèle Airport
            Airport.import_csv(params[:file])
            render json: { message: "Data imported successfully" }, status: :ok
          rescue => e
            # Gérer les erreurs pendant l'importation
            render json: { error: "Failed to import data: #{e.message}" }, status: :unprocessable_entity
          end
        else
          render json: { error: "No file uploaded" }, status: :unprocessable_entity
        end
      end

      private

      def airport_params
        # Permet de spécifier les paramètres autorisés pour les aéroports
        params.require(:airport).permit(
          :ident, :type, :name, :latitude_deg, :longitude_deg, :elevation_ft,
          :continent, :country_name, :iso_country, :region_name, :iso_region,
          :local_region, :municipality, :scheduled_service, :gps_code, :iata_code,
          :local_code, :home_link, :wikipedia_link, :keywords, :score
        )
      end
    end
  end
end
