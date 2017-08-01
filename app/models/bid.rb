class Bid < ApplicationRecord
  validates :comment, presence: true
  # validates :amount, presence: true

  belongs_to :pro, foreign_key: :user_id
  belongs_to :project
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  enum status: [:open, :accepted, :rejected, :withdrawn]

  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments

  def update_statuses(new_status)
    update!(status: new_status)
    return if new_status == "withdrawn"
    close_other_bids if new_status == "accepted"
  end

  def close_other_bids
    bids = Bid.where(project_id: self.project_id, status: "open")
    bids.each { |b| b.status = "rejected"}
  end
end
