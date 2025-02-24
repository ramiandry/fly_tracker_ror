module Api
  module V1
    class AircraftsController < ApplicationController
      # GET /api/v1/aircrafts
      def index
        aircrafts = Aircraft.all
        render json: aircrafts
      end

      # GET /api/v1/aircrafts/:id
      def show
        aircraft = Aircraft.find_by(id: params[:id])
        if aircraft
          render json: aircraft
        else
          render json: { error: "Aircraft not found" }, status: :not_found
        end
      end

      # POST /api/v1/aircrafts
      def create
        aircraft = Aircraft.new(aircraft_params)
        if aircraft.save
          render json: aircraft, status: :created
        else
          render json: { errors: aircraft.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/aircrafts/:id
      def update
        aircraft = Aircraft.find_by(id: params[:id])
        if aircraft
          if aircraft.update(aircraft_params)
            render json: aircraft
          else
            render json: { errors: aircraft.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: "Aircraft not found" }, status: :not_found
        end
      end

      # DELETE /api/v1/aircrafts/:id
      def destroy
        aircraft = Aircraft.find_by(id: params[:id])
        if aircraft
          aircraft.destroy
          head :no_content
        else
          render json: { error: "Aircraft not found" }, status: :not_found
        end
      end

      # POST /api/v1/aircrafts/import
      def import
        # Vérifie si un fichier a bien été soumis
        if params[:file].present?
          Aircraft.import_csv(params[:file])  # Appelle la méthode d'importation
          render json: { message: "Data imported successfully" }, status: :ok
        else
          render json: { error: "No file uploaded" }, status: :unprocessable_entity
        end
      end

      private

      def aircraft_params
        # Permet de spécifier les paramètres autorisés pour les avions
        params.require(:aircraft).permit(
          :icao24, :timestamp, :acars, :adsb, :built, :categoryDescription, :country, :engines,
          :firstFlightDate, :firstSeen, :icaoAircraftClass, :lineNumber, :manufacturerIcao,
          :manufacturerName, :model, :modes, :nextReg, :notes, :operator, :operatorCallsign,
          :operatorIata, :operatorIcao, :owner, :prevReg, :regUntil, :registered, :registration,
          :selCal, :serialNumber, :status, :typecode, :vdl
        )
      end
    end
  end
end
