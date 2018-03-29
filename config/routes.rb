Rails.application.routes.draw do
  resources :events
  resources :people
  resources :products

  resources :categories, param: :category_id, only: [] do
    collection do
    end

    member do
      get :products

      resources :subcategories, param: :subcategory_id, only: [:index] do
        member do
          get :products
        end
      end

    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "welcome/say" => "welcome#say"
  get "welcome" => "welcome#index"
  get "welcome/:id", to: "welcome#show"
  get "home" => "home#index"
  root "products#index"

  get "admin/log_in", to: "admin#log_in"
  post "admin/create_session", to: "admin#create_session"
  get "admin/log_out", to: "admin#log_out"
  
  #match ':controller(/:action(/:id(.:format)))', :via => :all
end
