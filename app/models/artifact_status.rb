class ArtifactStatus < ActiveRecord::Base
  belongs_to :project
  has_many :artifacts
  attr_accessible :title
end
