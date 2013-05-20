class ArtifactType < ActiveRecord::Base
  belongs_to :project
  has_many :artifacts
  attr_accessible :title, :shortening
end
