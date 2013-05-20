class AddShorteningToArtifactTypes < ActiveRecord::Migration
  def change
    add_column :artifact_types, :shortening, :string
  end
end
