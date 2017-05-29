Rails.application.routes.draw do
  devise_for :users
  resources :posts do
  	resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "tags/:tag" => "tags#show", as: "tag"
  get "tags/" => "tags#search", as: "tags"
  root 'posts#index'
end
