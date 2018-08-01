Rails.application.routes.draw do
  resources :stories
  root 'pages#show', page: 'home'
  get '/:page' => 'pages#show'
end
