CancannibleDemo::Application.routes.draw do

  devise_for :users

  resources :articles, :customers, :groups, :users, :roles

  root to: "home#index"
end
