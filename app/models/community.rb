class Community < ApplicationRecord
  has_many :community_membership, dependent: :destroy
  has_many :users, through: :memberships
  validates :name, presence: true
  enum :visibility, { public: "public", restricted: "restricted" }, default: :public, prefix: true
end
