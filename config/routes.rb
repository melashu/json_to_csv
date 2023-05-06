Rails.application.routes.draw do
  post '/convert', to: 'converts#index'
  get '/convert/previous', to: 'converts#previous'
end
