class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true

  enum :vote_type, { upvote: 0, downvote: 1 }, validate: true
end
