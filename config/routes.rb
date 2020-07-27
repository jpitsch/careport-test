Rails.application.routes.draw do
  get '/', to: 'visits#index'
  resources :hospitals, only: [:show]
end
