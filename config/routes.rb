Rails.application.routes.draw do
  resources :stories, except: %i[new show]

  root 'pages#show', page: 'home'
  get '/:page' => 'pages#show'
end
