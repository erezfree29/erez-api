# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http: //guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :albums do
        resources :photos, only: %i[create show update destroy]
      end
    end
  end
end
