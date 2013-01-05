Sprezzyrank::Application.routes.draw do
  resources :crunch_companies do
  	collection do
  		post 'crunch'
  	end
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end