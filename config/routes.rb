Rails.application.routes.draw do
  match '/radar', to: 'api/v1/objectives#create', via: :post

  namespace :api do
    namespace :v1 do
      resources :objectives, only: :create
    end
  end
end
