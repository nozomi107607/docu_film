Rails.application.routes.draw do
 devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }



 namespace :public do
    resources :users, only: [:show, :edit, :update]
    resources :films, only: [:new, :create, :index, :show, :destroy, :edit, :update]

 end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
