Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :rooms do
    member do
      get 'add_photo'
      post 'create_photo'
    end
  end

  resources :room_photos, only: [:destroy]
end


Rails.application.routes.draw do
  resources :rooms
end

