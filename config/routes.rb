Rails.application.routes.draw do
  get '/', to: 'reads#index'

  namespace :api do
    namespace :v1 do
      get '/reads', to: 'reads#index'
      post '/reads', to: 'reads#create'
    end
  end
end
