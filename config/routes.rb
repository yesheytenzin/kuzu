Rails.application.routes.draw do
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "posts/:post_id/comments", to: "comments#index"
  get "posts/:post_id/comments/:comment_id", to: "comments#show"
  post "posts/:post_id/comments", to: "comments#create"
  put "posts/:post_id/comments/:comment_id", to: "comments#update"
  delete "posts/:post_id/comments/:comment_id", to: "comments#destroy"

  get "up" => "rails/health#show", as: :rails_health_check
end
