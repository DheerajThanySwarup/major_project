Rails.application.routes.draw do
  devise_for :users
  resources :pins
  resources :pins do
  	get "mypins"
  end
  devise_scope :user do
  authenticated :user do
    root 'pins#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
end
