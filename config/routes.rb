Rails.application.routes.draw do
  root "books#index" 
  devise_for :users, controllers: { registrations: 'user/registrations' }
  resources :books
  resources :users, :only => [:show]
  get 'user/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/user/sign_out' => 'devise/sessions#destroy'
    get '/user/show' => 'user#show'
    get '/users' => 'users#index'
    get '/users/:id' => 'users#show'
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
