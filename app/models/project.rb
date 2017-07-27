class Project < ApplicationRecord
  validates :zipcode, presence: true
  validates :timeline, presence: true
  validates :description, presence: true
  validates :status, presence: true

  enum status: [:open, :accepted, :closed]
  enum timeline: ['ASAP', 'Within 2 Weeks', 'Within 2 Months', 'Whenever']

  belongs_to :requester, :class_name => 'User'
  belongs_to :service
  has_many :bids

  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments

end
