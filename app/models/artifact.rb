class Artifact < ActiveRecord::Base
  belongs_to :project
  belongs_to :parent
  belongs_to :assignee
  belongs_to :artifact_type
  attr_accessible :description, :identifier
end
