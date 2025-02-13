class Api::FlightsController < ApplicationController
  def index
      begin_timestamp = params[:begin].to_i
      end_timestamp = params[:end].to_i

      # Vérifie si les timestamps sont valides
      if begin_timestamp > 0 && end_timestamp > 0
        begin
          opensky_service = OpenskyService.new()
          flights = opensky_service.get_flights(begin_timestamp, end_timestamp)
          
          render json: flights
        rescue => e
          render json: { error: e.message }, status: :internal_server_error
        end
      else
        render json: { error: 'Invalid timestamps' }, status: :unprocessable_entity
      end
end
end
