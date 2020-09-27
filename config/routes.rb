Rails.application.routes.draw do
  resources :users, only: %i[new create show]
  resources :tweets
  root 'tweets#index'
  get '/sign_up', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'
  post '/follow_user', to: 'followings#create'
  delete '/unfollow_user', to: 'followings#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
