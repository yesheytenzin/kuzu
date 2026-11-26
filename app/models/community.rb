class Community < ApplicationRecord
  has_many :community_memberships
  has_many :members, through: :community_memberships, source: :user
  validates :name, presence: true
  enum :visibility, { public: "public", restricted: "restricted" }, default: :public, prefix: true
end
