Rails.application.routes.draw do
  resources :scouters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'scouters#new'
end
