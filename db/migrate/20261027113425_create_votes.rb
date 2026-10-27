class CreateVotes < ActiveRecord::Migration[8.1]
  def change
    create_table :votes, id: :uuid do |t|
      t.references :votable, polymorphic: true, null: false, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.integer :vote_type, null: false

      t.timestamps
    end

    add_index :votes, [:user_id, :votable_type, :votable_id], unique: true
  end
end