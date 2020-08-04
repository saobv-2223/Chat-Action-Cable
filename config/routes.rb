Rails.application.routes.draw do
  root "homes#index"

  devise_for :users,
             path: "",
             path_names: {
               sign_in: "login",
               sign_up: "registration",
               sign_out: "logout"
             }
end
