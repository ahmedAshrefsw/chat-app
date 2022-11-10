Rails.application.routes.draw do
  resources :messages
  resources :chats
  get '/applications' , to: 'chat_applications#index'
  get '/applications/:token', to: 'chat_applications#show'
  post '/applications', to:'chat_applications#create'
  patch '/applications/:id', to:'chat_application#update'
  delete '/applications/:id', to:'chat_application#destroy'

  get 'applications/:token/chats', to:'chats#index'
  get 'applications/:token/chats/:number', to:'chats#show'
  post 'applications/:token/chats', to:'chats#create'
  patch 'applications/:token/chats/:number', to:'chats#update'
  delete 'applications/:token/chats/:number', to:'chats#destroy'

  get 'applications/:token/chats/:number/messages', to:'chats#index'
  get 'applications/:token/chats/:number/messages/:mnumber', to:'chats#show'
  post 'applications/:token/chats/:number/messages', to:'chats#create'
  patch 'applications/:token/chats/:number/messages/:mnumber', to:'chats#update'
  delete 'applications/:token/chats/:number/messages/:mnumber', to:'chats#destroy'
end
