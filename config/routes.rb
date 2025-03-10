Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  namespace :api do
    resources :aircrafts, only: [ :index ]
  end

  namespace :api do
    resources :flights, only: [ :index ]
  end

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  namespace :api do
    namespace :v1 do
      resources :mails, only: [] do
        collection do
          post "send_welcome_email"  # Pas besoin d'un :id
        end
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :aircrafts, except: [ :new, :edit ] do
        collection do
          post "import"  # Route pour importer les fichiers CSV
        end
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :airports do
        collection do
          post "import"  # Route pour importer les fichiers CSV
        end
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :historiques
    end
  end

  namespace :api do
    namespace :v1 do
      resources :flights
    end
  end

  namespace :api do
    namespace :v1 do
      resources :vol_favoris
    end
  end

  namespace :api do
    namespace :v1 do
      resources :alerts
    end
  end

  namespace :api do
    namespace :v1 do
      post "authenticate", to: "authentication#authenticate"  # Route pour l'authentification
    end
  end




  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
