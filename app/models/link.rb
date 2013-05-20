class Link < ActiveRecord::Base
  belongs_to :project
  belongs_to :from_artifact, class_name: 'Artifact'
  belongs_to :to_artifact, class_name: 'Artifact'
end
