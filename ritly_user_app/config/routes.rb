RitlyApp::Application.routes.draw do

  get "sessions/new"
  get "sessions/destroy"
  get "users/new"
  get "users/show"
  get "users/create"
  resources :users, :sessions

  get '/signup' => 'users#new'
	delete '/signout', to: 'sessions#destroy'
	get'/signin' => 'sessions#new'

  root to: "links#index"

  get "/go/:ritlyurl/preview", to: "links#show"

  get "/view", to: "links#view"

  patch "/go/:ritlyurl", to: "links#redirect"

  post "/go", to: "links#create"

  delete "go/:id", to: "links#destroy"

end
