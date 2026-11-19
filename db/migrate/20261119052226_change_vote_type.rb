class ChangeVoteType < ActiveRecord::Migration[8.1]
  def change
    change_column :votes, :vote_type, :string
  end
end
