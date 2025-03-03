class Api::V1::HistoriquesController < ApplicationController
  # GET /api/v1/historiques
  def index
    historiques = Historique.all
    render json: historiques
  end

  # GET /api/v1/historiques/:id
  def show
    historique = Historique.find_by(id: params[:id])
    if historique
      render json: historique
    else
      render json: { error: "Historique not found" }, status: :not_found
    end
  end

  # POST /api/v1/historiques
  def create
    historique = Historique.new(historique_params)
    if historique.save
      render json: historique, status: :created
    else
      render json: { errors: historique.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/historiques/:id
  def update
    historique = Historique.find_by(id: params[:id])
    if historique
      if historique.update(historique_params)
        render json: historique
      else
        render json: { errors: historique.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Historique not found" }, status: :not_found
    end
  end

  # DELETE /api/v1/historiques/:id
  def destroy
    historique = Historique.find_by(id: params[:id])
    if historique
      historique.destroy
      head :no_content
    else
      render json: { error: "Historique not found" }, status: :not_found
    end
  end

  private

  def historique_params
    # Permet de spécifier les paramètres autorisés pour les historiques
    params.require(:historique).permit(:aircraft_id, :user_id, :action, :timestamp, :details)
  end
end
