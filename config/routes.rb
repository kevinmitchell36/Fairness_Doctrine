Rails.application.routes.draw do
  namespace :v1 do
    get '/' => 'publications#index'
    post '/publications' => 'publications#create'
    get '/publications/:id' => 'publications#show'
    patch '/publications/:id' => 'publications#update'
    delete '/publications/:id' => 'publications#destroy'

    post '/users' => 'users#create'
    post '/user_token' => 'user_token#create'
  end
end

