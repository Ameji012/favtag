Rails.application.routes.draw do
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      match '/tweets', to: 'tweets#index', via: [:get, :options]
      match '/tweets', to: 'tweets#search', via: [:post, :options]
    end
  end

end
