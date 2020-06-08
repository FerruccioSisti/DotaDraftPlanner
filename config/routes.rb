Rails.application.routes.draw do
  get 'pages/about'
  resources :scouters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'scouters#new'
  get 'about', to: 'pages#about'
  get 'history', to: 'scouters#history'
end
