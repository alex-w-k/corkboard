class Category < ApplicationRecord
  include Sluggable

  before_validation :generate_slug
  before_save :generate_uri

  validates :industry, presence: true
  validates :name, presence: true
  validates :slug, presence: true,
                   uniqueness: true

  belongs_to :industry
  has_many :services, dependent: :destroy

  def generate_uri
    self.uri = "hire/#{self.industry.slug}/#{self.slug}"
  end
end
