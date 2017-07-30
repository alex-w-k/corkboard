class Industry < ApplicationRecord
  include Sluggable

  before_validation :generate_slug
  before_save :generate_uri
  validates :name, presence: true,
                   uniqueness: true

  validates :slug, presence: true,
                   uniqueness: true

  has_many :categories
  has_many :services, through: :categories

  def generate_uri
    self.uri = "hire/#{self.slug}"
  end
end
