class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :artifact
  belongs_to :owner
  attr_accessible :body
end
