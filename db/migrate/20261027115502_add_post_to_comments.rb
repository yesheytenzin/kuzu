class AddPostToComments < ActiveRecord::Migration[8.1]
  def change
    t.reference :comments, :post, foreign_key: true, null: false, type: :uuid
  end
end
