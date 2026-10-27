class RenameCommentToBody < ActiveRecord::Migration[8.1]
  def change
    rename_column :comments, :comment, :body
  end
end
