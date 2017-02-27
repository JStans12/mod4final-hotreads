Rails.application.routes.draw do
  get '/', to: 'reads#index'

  namespace :api do
    namespace :v1 do
      post '/reads', to: 'reads#create'
    end
  end
end
