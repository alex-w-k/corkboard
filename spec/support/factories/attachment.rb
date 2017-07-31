FactoryGirl.define do
  factory :attachment do
    attachable_id {create(:project).id}
    attachable_type 'Project'
    upload_file_name 'image.png'
    upload_content_type 'image/png'
    upload_file_size 1

  end
end
