Rails.application.routes.draw do

  get '/urls', to: 'urls#index'
  get '/urls/new', to: 'urls#new'
  post '/urls/create', to: 'urls#create'
  # get '/urls/:id', to: 'urls#show'
  # get '/urls/:id/edit' to: 'urls#edit'
  # patch '/urls/:id' to: 'urls#update'
  # delete '/urls/:id' to: 'urls#destroy' 
  get 'urls/:id/:short_url' => "urls#short_url"

 
end
