# app/services/opensky_service.rb
class OpenskyService
  include HTTParty
  base_uri 'https://opensky-network.org/api'

  def initialize()
  end

  def get_aircrafts
    response = self.class.get('/states/all')

    if response.success?
      return response.parsed_response['states']
    else
      raise 'Erreur de récupération des données depuis OpenSky'
    end
  end

  def get_flights(begin_timestamp, end_timestamp)
    response = self.class.get("/flights/all", {
      query: { begin: begin_timestamp, end: end_timestamp }
    })

    # Vérification si la réponse est réussie
    if response.success?
      return response.parsed_response
    else
      raise 'Erreur de récupération des informations de vol'
    end
  end
end
