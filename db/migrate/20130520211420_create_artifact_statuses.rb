class CreateArtifactStatuses < ActiveRecord::Migration
  def change
    create_table :artifact_statuses do |t|
      t.references :project
      t.string :title

      t.timestamps
    end
    add_index :artifact_statuses, :project_id
  end
end
