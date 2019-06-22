Rails.application.routes.draw do
  namespace :api do
 
    get '/patterns' => 'patterns#index'
    post '/patterns' => 'patterns#create'
    get '/patterns/:id'  => 'patterns#show'
    patch '/patterns/:id' => 'patterns#update'
    delete '/patterns/:id' => 'patterns#destroy'

    get '/users'  => 'users#index' 
    post "/users" => "users#create"
    get '/users/:id'  => 'users#show'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'
     
    post "/sessions" => "sessions#create"

    get '/closets' => 'closets#index'
    post '/closets' => 'closets#create'
    get '/closets/:id'  => 'closets#show'
    patch '/closets/:id' => 'closets#update'
    delete '/closets/:id' => 'closets#destroy'

    get '/closet_patterns' => 'closet_patterns#index'
    post '/closet_patterns' => 'closet_patterns#create'
    get '/closet_patterns/:id'  => 'closet_patterns#show'
    patch '/closet_patterns/:id' => 'closet_patterns#update'
    delete '/closet_patterns/:id' => 'closet_patterns#destroy'

    get '/tags' => 'tags#index'
    post '/tags' => 'tags#create'
    get '/tags/:id'  => 'tags#show'
    patch '/tags/:id' => 'tags#update'
    delete '/tags/:id' => 'tags#destroy'

    get '/images' => 'images#index'
    post '/images' => 'images#create'
    get '/images/:id'  => 'images#show'
    patch '/images/:id' => 'images#update'
    delete '/images/:id' => 'images#destroy'

    get '/notes' => 'notes#index'
    post '/notes' => 'notes#create'
    get '/notes/:id'  => 'notes#show'
    patch '/notes/:id' => 'notes#update'
    delete '/notes/:id' => 'notes#destroy'
  end   
end
