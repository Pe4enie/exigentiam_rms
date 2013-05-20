class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :project
      t.references :artifact
      t.references :owner
      t.text :body

      t.timestamps
    end
    add_index :comments, :project_id
    add_index :comments, :artifact_id
    add_index :comments, :owner_id
  end
end
