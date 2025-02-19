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
        aircraft = Aircraft.find(params[:id])
        render json: aircraft
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
        aircraft = Aircraft.find(params[:id])
        if aircraft.update(aircraft_params)
          render json: aircraft
        else
          render json: { errors: aircraft.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/aircrafts/:id
      def destroy
        aircraft = Aircraft.find(params[:id])
        aircraft.destroy
        head :no_content
      end

      private

      def aircraft_params
        params.require(:aircraft).permit(
          :icao24, :acars, :adsb, :built, :categoryDescription, :country, :engines, 
          :firstFlightDate, :firstSeen, :icaoAircraftClass, :lineNumber, :manufacturerIcao, 
          :manufacturerName, :model, :modes, :nextReg, :notes, :operator, :operatorCallsign, 
          :operatorIata, :operatorIcao, :owner, :prevReg, :regUntil, :registered, :registration, 
          :selCal, :serialNumber, :status, :typecode, :vdl
        )
      end
    end
  end
end
