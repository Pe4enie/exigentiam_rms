class Link < ActiveRecord::Base
  belongs_to :project
  belongs_to :from_artifact
  belongs_to :to_artifact
  # attr_accessible :title, :body
end
