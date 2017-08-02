class OpenProjectPresenter < SimpleDelegator

  def to_bid_on
    @to_bid_on ||= self.open_projects.select do |open_project|
      distance = self.distance_to(open_project)
      distance < self.radius && !self.in?(open_project.pros)
    end
  end
  
end