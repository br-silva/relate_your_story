Rails.application.routes.draw do
  root 'pages#show', page: 'home'

  resources :stories, except: %i[show]

  get  'signup' => 'users#new'
  post 'users'  => 'users#create'

  get  'login'  => 'sessions#new'
  post 'login'  => 'sessions#create'
  get  'logout' => 'sessions#destroy'

  get  'report' => 'reports#new'
  post 'report' => 'reports#create'

  get '/:page' => 'pages#show'
end
