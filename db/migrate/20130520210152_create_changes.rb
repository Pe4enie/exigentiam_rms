class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.references :project
      t.references :artifact
      t.references :changer
      t.integer :version
      t.text :description
      t.references :artifact_type
      t.references :assignee
      t.references :artifact_status

      t.timestamps
    end
    add_index :changes, :project_id
    add_index :changes, :artifact_id
    add_index :changes, :changer_id
    add_index :changes, :artifact_type_id
    add_index :changes, :assignee_id
    add_index :changes, :artifact_status_id
  end
end
