Rails.application.routes.draw do
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  devise_for :users
  devise_scope :user do
    get "signup", to: "devise/registrations#new"
    post "signup", to: "devise/registrations#create"
    get "signin", to: "devise/sessions#new"
    post "signin", to: "devise/sessions#create"
    get "edit", to: "devise/registrations#edit"
    put "edit", to: "devise/registrations#update"
  end
end
