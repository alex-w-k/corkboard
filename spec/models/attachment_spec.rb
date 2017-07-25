require 'rails_helper'

RSpec.describe Attachment do
  it { should have_attached_file(:upload) }
  it { should validate_attachment_presence(:upload) }
  it { should validate_attachment_content_type(:upload).
                allowing('image/jpg', 'image/jpeg', 'image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
  it {should belong_to(:attachable) }
end