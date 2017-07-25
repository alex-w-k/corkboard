class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  has_attached_file :upload

  has_attached_file :upload, :styles => {
                                        :thumb => "100x100#",
                                        :medium => "200x200",
                                        }

  validates_attachment_content_type :upload, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
end
