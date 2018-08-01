Rails.application.routes.draw do
  resources :posts
  root 'pages#show', page: 'home'
  get '/:page' => 'pages#show'
end
