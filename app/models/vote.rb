class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true

  enum :vote_type, { upvote: "upvote", downvote: "downvote" }, validate: true
end
