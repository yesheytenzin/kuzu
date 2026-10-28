class AddPostToComments < ActiveRecord::Migration[8.1]
  def change
    add_reference :comments, :post, foreign_key: true, null: false, type: :uuid
  end
end
