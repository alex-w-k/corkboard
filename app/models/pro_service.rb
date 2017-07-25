class ProService < ApplicationRecord
  belongs_to :pro, foreign_key: "user_id", optional: true
  belongs_to :service
  validates :radius, presence: true
end
