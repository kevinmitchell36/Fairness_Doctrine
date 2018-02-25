Rails.application.routes.draw do
  namespace :v1 do
    get '/' => 'publications#index'
  end
end

