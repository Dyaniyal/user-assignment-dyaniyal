Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  # get 'users/create'
  # get 'users/update'
  # get 'users/destroy'
    # devise_scope :user do
    #   get '/users/sign_out' => 'devise/sessions#destroy'
    # end

  devise_scope :user do
    root to: "users#index"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  resources :users
    # resources :users  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "users/sessions#new"
end
