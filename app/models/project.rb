class Project < ApplicationRecord
  validates :zipcode, presence: true
  validates_format_of :zipcode,
                with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                message: "should be 12345 or 12345-1234",
                allow_blank: true
  validates :timeline, presence: true
  validates :description, presence: true
  validates :status, presence: true

  enum status: [:open, :accepted, :closed]
  enum timeline: ['ASAP', 'Within 2 Weeks', 'Within 2 Months', 'Whenever']

  belongs_to :requester, :class_name => 'User'
  belongs_to :service
  has_many :bids
  has_many :pros, through: :bids
  has_one :review
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments

  geocoded_by :zipcode
  after_validation :geocode


  def pro
    Pro.find_by(id: (self.bids.find_by(status: "accepted").user_id))
  end
end
