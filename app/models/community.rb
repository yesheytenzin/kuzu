class Community < ApplicationRecord
  has_many :community_membership, dependent: :destroy
  validates :name, presence: true
  enum :visibility, { public: "public", restricted: "restricted" }, default: :public
end
