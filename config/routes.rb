Rails.application.routes.draw do
  resources :events
  resources :people
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "welcome/say" => "welcome#say"
  get "welcome" => "welcome#index"
  get "welcome/:id", to: "welcome#show"
  get "home" => "home#index"
  root "products#index"
  #match ':controller(/:action(/:id(.:format)))', :via => :all
end
