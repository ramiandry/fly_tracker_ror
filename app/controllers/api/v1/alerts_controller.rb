class Api::V1::AlertsController < ApplicationController
  # GET /api/v1/alerts
  def index
    alerts = Alert.all
    render json: alerts
  end

  # GET /api/v1/alerts/:id
  def show
    alert = Alert.find_by(id: params[:id])
    if alert
      render json: alert
    else
      render json: { error: 'Alert not found' }, status: :not_found
    end
  end

  # POST /api/v1/alerts
  def create
    alert = Alert.new(alert_params)
    if alert.save
      render json: alert, status: :created
    else
      render json: { errors: alert.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/alerts/:id
  def update
    alert = Alert.find_by(id: params[:id])
    if alert
      if alert.update(alert_params)
        render json: alert
      else
        render json: { errors: alert.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Alert not found' }, status: :not_found
    end
  end

  # DELETE /api/v1/alerts/:id
  def destroy
    alert = Alert.find_by(id: params[:id])
    if alert
      alert.destroy
      head :no_content
    else
      render json: { error: 'Alert not found' }, status: :not_found
    end
  end

  private

  def alert_params
    params.require(:alert).permit(:user_id, :flight_id, :alert_type, :message, :read)
  end
end
