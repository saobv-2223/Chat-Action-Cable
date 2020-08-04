Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  root "homes#index"

  devise_for :users,
             path: "",
             path_names: {
               sign_in: "login",
               sign_up: "registration",
               sign_out: "logout"
             }

  get "message", to: "messages#index"
  post "message", to: "messages#create"
  get "message/:id", to: "messages#show", as: "show_messages"
end
