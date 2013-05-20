class CreateArtifactTypes < ActiveRecord::Migration
  def change
    create_table :artifact_types do |t|
      t.references :project
      t.string :title

      t.timestamps
    end
    add_index :artifact_types, :project_id
  end
end
