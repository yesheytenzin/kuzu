Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Login routes
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Post routes
  get "posts", to: "posts#index"
  get "posts/:id", to: "posts#show"
  post "posts", to: "posts#create"
  put "posts/:id", to: "posts#update"
  delete "posts/:id", to: "posts#destroy"

  # Comment routes
  get "posts/:post_id/comments", to: "comments#index"
  get "posts/:post_id/comments/:comment_id", to: "comments#show"
  post "posts/:post_id/comments", to: "comments#create"
  put "posts/:post_id/comments/:comment_id", to: "comments#update"
  delete "posts/:post_id/comments/:comment_id", to: "comments#destroy"

  # Vote routes
  get "posts/:post_id/comments/:id/votes", to: "votes#score"
  get "posts/:id/votes", to: "votes#score"
  post "posts/:id/votes", to: "votes#vote"
  post "posts/:id/votes", to: "votes#vote"
  post "posts/:post_id/comments/:id/vote", to: "votes#vote"

  post "communities/:community_id/memberships", to: "memberships#create"
end
