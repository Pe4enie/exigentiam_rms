class RemoveProjectIdFromArtifactTypesAndStatuses < ActiveRecord::Migration
  def change
    remove_column :artifact_types, :project_id
    remove_column :artifact_statuses, :project_id
  end
end
