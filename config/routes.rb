Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#top"
  resources :creators, only:[:new, :create, :show]

  resources :rooms, onl: [:show, :create] do
    resources :messages, only: [:create]
  end
end
