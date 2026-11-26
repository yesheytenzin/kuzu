class CreateCommunities < ActiveRecord::Migration[8.1]
  def change
    create_table :communities, id: :uuid do |t|
      t.string :name
      t.string :description
      t.string :visibility

      t.timestamps
    end
  end
end
