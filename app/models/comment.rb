class Comment < ApplicationRecord
belongs_to :parent, class_name: "Comment", optional: true
belongs_to :post, dependent: :destroy
belongs_to :user, dependent: :destroy
end
