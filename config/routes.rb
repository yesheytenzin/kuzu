Rails.application.routes.draw do
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check

  # vote api
  get 'post_vote', to: "votes#posts"
  get 'comment_vote',to: "votes#comments"
end
