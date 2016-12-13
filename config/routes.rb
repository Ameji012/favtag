Rails.application.routes.draw do
  
  get 'static_pages/index'
  root 'static_pages#index'
  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      # searches endpoints
      match '/searches', to: 'searches#index', via: [:get, :options]
      match '/searches/:id', to: 'searches#show', via: [:get, :options]
      # tweets endpoints
      match '/tweets', to: 'tweets#search', via: [:post, :options]
    end
  end

end
