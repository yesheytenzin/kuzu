class ChangeCommentsIdToUuid < ActiveRecord::Migration[8.1]
  def up
    add_column :comments, :uuid_id, :uuid, default: -> { "gen_random_uuid()" }, null: false
    execute "ALTER TABLE comments DROP CONSTRAINT comments_pkey;"
    remove_column :comments, :id
    rename_column :comments, :uuid_id, :id
    execute "ALTER TABLE comments ADD PRIMARY KEY (id);"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Converting UUID back to Integer is not automatically supported."
  end
end
