class LinkSchema < ActiveRecord::Base
  belongs_to :project
  belongs_to :from_type
  belongs_to :to_type
  # attr_accessible :title, :body
end
