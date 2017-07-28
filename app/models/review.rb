class Review < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def star_rated
    ("<i class='fa fa-star star-rated' aria-hidden='true'></i>" * (self.rating)).html_safe
  end

  def star_denied
    ("<i class='fa fa-star star-denied' aria-hidden='true'></i>" * (5 - self.rating)).html_safe
  end
end
