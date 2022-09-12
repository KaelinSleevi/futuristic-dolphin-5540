Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id/:ride_id', to: 'mechanics#update'
  post '/mechanics/:id', to: 'mechanics#edit'
  get '/mechanics/:id', to: 'mechanics#show'
end
