module Api
  class AircraftsController < ApplicationController
    def index
      begin
        opensky_service = OpenskyService.new()
        aircrafts = opensky_service.get_aircrafts
        render json: aircrafts
      rescue => e
        render json: { error: e.message }, status: :internal_server_error
      end
    end
  end
end
