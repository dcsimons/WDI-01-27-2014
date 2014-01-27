RitlyApp::Application.routes.draw do

  root to: "links#index"

  get "/go/:ritlyurl/preview", to: "links#show"

  get "/view", to: "links#view"

  patch "/go/:ritlyurl", to: "links#redirect"

  post "/go", to: "links#create"

  delete "go/:id", to: "links#destroy"

end
