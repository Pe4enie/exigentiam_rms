class Attachment < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
  belongs_to :project
  belongs_to :artifact
  belongs_to :user
  attr_accessible :file
  mount_uploader :file, FileUploader

  def to_jq_upload
    {
        'url' => file.url,
        'name' => read_attribute(:file),
        'size' => file.size,
        'delete_url' => '/attachments/' + self.id.to_s,
        'delete_type' => 'DELETE'
    }
  end
end
