class Api::V1::VolFavorisController < ApplicationController
  before_action :authorize_request
  def index
    vol_favoris = VolFavori.all
    render json: vol_favoris
  end

  # GET /api/v1/vol_favoris/:id
  def show
    vol_favori = VolFavori.find_by(id: params[:id])
    if vol_favori
      render json: vol_favori
    else
      render json: { error: "VolFavori not found" }, status: :not_found
    end
  end

  # POST /api/v1/vol_favoris
  def create
    vol_favori = VolFavori.new(vol_favori_params)
    if vol_favori.save
      render json: vol_favori, status: :created
    else
      render json: { errors: vol_favori.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/vol_favoris/:id
  def destroy
    vol_favori = VolFavori.find_by(id: params[:id])
    if vol_favori
      vol_favori.destroy
      head :no_content
    else
      render json: { error: "VolFavori not found" }, status: :not_found
    end
  end

  private

  def vol_favori_params
    params.require(:vol_favori).permit(:user_id, :flight_id)
  end
end
