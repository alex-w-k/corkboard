class Review < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def star_rated
    yellow_star_html = "<i class='fa fa-star star-rated' aria-hidden='true'></i>"
    (yellow_star_html * self.rating.round).html_safe
  end

  def star_denied
    gray_star_html = "<i class='fa fa-star star-denied' aria-hidden='true'></i>"
    (gray_star_html * (5 - self.rating.round)).html_safe
  end

end
