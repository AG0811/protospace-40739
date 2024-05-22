Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]  # 追加する
  resources :prototypes do
    resources :comments, only: [:create]
  end


  # Defines the root path route ("/")
  # root "articles#index"
  root "prototypes#index"
end
