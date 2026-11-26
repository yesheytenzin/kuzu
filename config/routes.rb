Rails.application.routes.draw do
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "posts", to: "posts#index"
  get "posts/:id", to: "posts#show"
  put "posts/:id", to: "posts#update"
  delete "posts/:id", to: "posts#destroy"

  post "posts", to: "posts#create"

  # Comment routes
  get "posts/:post_id/comments", to: "comments#index"
  get "posts/:post_id/comments/:comment_id", to: "comments#show"
  post "posts/:post_id/comments", to: "comments#create"
  put "posts/:post_id/comments/:comment_id", to: "comments#update"
  delete "posts/:post_id/comments/:comment_id", to: "comments#destroy"

  get "up" => "rails/health#show", as: :rails_health_check

  put "post/:id", to: "posts#update"
  delete "post/:id", to: "posts#destroy"

  get "posts/:post_id/comments/:id/votes", to: "votes#score"
  get "posts/:id/votes", to: "votes#score"
  post "posts/:id/vote", to: "votes#vote"
  post "posts/:post_id/comments/:id", to: "votes#vote"
end
