class LinkSchema < ActiveRecord::Base
  belongs_to :project
  belongs_to :from_type, class_name: 'ArtifactType'
  belongs_to :to_type, class_name: 'ArtifactType'
end
