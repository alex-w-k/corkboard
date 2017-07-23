class Category < ApplicationRecord
  include Sluggable

  before_validation :generate_slug

  validates :industry, presence: true
  validates :name, presence: true
  validates :slug, presence: true,
                   uniqueness: true

  belongs_to :industry
  has_many :services, dependent: :destroy
end
