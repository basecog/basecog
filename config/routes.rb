Rails.application.routes.draw do
  root to: redirect("/projects")

  get "up" => "rails/health#show", as: :rails_health_check

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :projects, except: [ :edit ] do
    resources :feature_flags
    resources :environments do
      resources :api_keys, only: [ :show, :new, :create, :destroy ]
    end
  end
  post "/projects/:project_id/treatments", to: "treatments#create_or_update", as: "project_treatments"
  get "/projects/:id/settings", to: "projects#settings", as: "project_settings"

  namespace :api do
    namespace :v0 do
      defaults format: :json do
        post "decide", to: "decision#create"
      end
    end
  end
end
