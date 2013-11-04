PollywogRanchRailsRuby003::Application.routes.draw do

  get '/', to: 'site#index'
  post '/frogs/:id/update', to: 'frogs#update'
  get '/frogs/:id/destroy', to: 'frogs#destroy'
  get '/frogs/:id/tadpoles/new', to: 'tadpoles#new'


  post '/ponds/:id/update', to: 'ponds#update'
  get '/ponds/:id/destroy' => 'ponds#destroy'

  post '/tadpoles/:id/update', to: 'tadpoles#update'
  get '/tadpoles/:id/destroy', to: 'tadpoles#destroy'
  get '/tadpoles/:id/evolve', to: 'tadpoles#evolve'

  resources :ponds, :frogs, :tadpoles

end
