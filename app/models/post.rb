
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
