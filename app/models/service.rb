class Service < ApplicationRecord
  include Sluggable

  has_many :pro_services
  has_many :pros, through: :pro_services, foreign_key: "user_id"
  before_validation :generate_slug
  before_save :generate_uri

  validates :name, presence: true
  validates :category, presence: true
  validates :slug, presence: true,
                   uniqueness: true

  belongs_to :category
  delegate :industry, :to => :category, :allow_nil => false

  has_many :projects

  def self.pro_service_ids(params)
    Service.where(id: params).map do |service|
      service.id
    end
  end

  def generate_uri
    self.uri = "hire/#{self.slug}/new"
  end

end
