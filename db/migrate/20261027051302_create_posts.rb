class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts, id: :uuid do |t|
      t.timestamps
      t.string :title, null: false
      t.text :body
      t.references :user, null: false, foreign_key: true, type: :uuid
    end
  end
end
