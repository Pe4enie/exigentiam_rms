class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|
      t.references :project
      t.references :parent
      t.references :assignee
      t.text :description
      t.string :identifier
      t.references :artifact_type

      t.timestamps
    end
    add_index :artifacts, :project_id
    add_index :artifacts, :parent_id
    add_index :artifacts, :assignee_id
    add_index :artifacts, :artifact_type_id
  end
end
