class CreateCommunityMemberships < ActiveRecord::Migration[8.1]
  def change
    create_table :community_memberships, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :community, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
