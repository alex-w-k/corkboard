module AttachmentsConcern
  extend ActiveSupport::Concern

  def add_attachment(element, required)
    element.attachments.create(upload: attachment_params(required)["0"][:upload])
  end

  def attachment_params(required)
    params.require(required)[:attachments_attributes]
  end
end