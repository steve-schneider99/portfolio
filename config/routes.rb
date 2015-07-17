Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  root :to => 'skills#index'

  resources :skills do
    resources :projects
  end

  resources :blogs do
    resources :comments
  end

  resources :references

end
