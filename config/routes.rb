Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"
  post '/guests/guest_sign_in', to: 'public/guests#new_guest'
  get '/about' => 'public/homes#about', as: 'about'

  namespace :public do
    resources :users, only: [:show, :edit, :update]
    resources :films, only: [:new, :create, :index, :show, :destroy, :edit, :update]

  end

  namespace :admin do
    resources :users, only: [:index, :show]
    resources :films, only: [:show, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end