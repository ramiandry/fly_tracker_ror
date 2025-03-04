class Api::V1::FlightsController < ApplicationController
  # GET /api/v1/flights
  def index
    flights = Flight.all
    render json: flights
  end

  # GET /api/v1/flights/:id
  def show
    flight = Flight.find_by(id: params[:id])
    if flight
      render json: flight
    else
      render json: { error: "Flight not found" }, status: :not_found
    end
  end

  # POST /api/v1/flights
  def create
    flight = Flight.new(flight_params)
    if flight.save
      render json: flight, status: :created
    else
      render json: { errors: flight.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/flights/:id
  def update
    flight = Flight.find_by(id: params[:id])
    if flight
      if flight.update(flight_params)
        render json: flight
      else
        render json: { errors: flight.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Flight not found" }, status: :not_found
    end
  end

  # DELETE /api/v1/flights/:id
  def destroy
    flight = Flight.find_by(id: params[:id])
    if flight
      flight.destroy
      head :no_content
    else
      render json: { error: "Flight not found" }, status: :not_found
    end
  end

  # POST /api/v1/flights/import
  # def import
  #   if params[:file].present?
  #     begin
  #       Flight.import_csv(params[:file])
  #       render json: { message: "Data imported successfully" }, status: :ok
  #     rescue => e
  #       render json: { error: "Failed to import data: #{e.message}" }, status: :unprocessable_entity
  #     end
  #   else
  #     render json: { error: "No file uploaded" }, status: :unprocessable_entity
  #   end
  # end

  private

  # Permet de spécifier les paramètres autorisés pour les vols
  def flight_params
    params.require(:flight).permit(
      :flight_code, :departure_time, :arrival_time,
      :origin_airport_id, :destination_airport_id, :status
    )
  end
end
