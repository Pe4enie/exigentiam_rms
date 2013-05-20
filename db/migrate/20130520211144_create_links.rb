class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :project
      t.references :from_artifact
      t.references :to_artifact

      t.timestamps
    end
    add_index :links, :project_id
    add_index :links, :from_artifact_id
    add_index :links, :to_artifact_id
  end
end
