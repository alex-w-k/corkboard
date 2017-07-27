FactoryGirl.define do
  factory :attachment do
    # upload {File.new("#{Rails.root}/spec/support/fixtures/image.png")}
    # upload { fixture_file_upload(Rails.root.join('spec', 'support', 'fixtures','image.png'), 'image/png') }
  # supporting_documentation_file_name { 'test.pdf' }
  # supporting_documentation_content_type { 'application/pdf' }
  # supporting_documentation_file_size { 1024 }
    attachable_id {create(:project).id}
    attachable_type 'Project'
    upload_file_name 'image.png'
    upload_content_type 'image/png'
    upload_file_size 1

  end
end
