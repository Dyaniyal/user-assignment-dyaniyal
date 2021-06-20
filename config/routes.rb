Rails.application.routes.draw do

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  resources :users, only: [:index, :show]
  
  root to: "users#index"
end
