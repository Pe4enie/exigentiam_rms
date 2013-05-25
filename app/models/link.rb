class Link < ActiveRecord::Base
  validates :project_id, uniqueness: { scope: [:from_artifact_id, :to_artifact_id], message: 'There is already a link between this two artifacts' }
  belongs_to :project
  belongs_to :from_artifact, class_name: 'Artifact'
  belongs_to :to_artifact, class_name: 'Artifact'
  attr_accessible :project, :from_artifact_id, :to_artifact_id
end
