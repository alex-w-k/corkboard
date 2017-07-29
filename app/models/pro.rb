class Pro < User
  has_many :pro_services, dependent: :destroy, foreign_key: "user_id"
  has_many :services, through: :pro_services
  has_many :bids
  has_many :reviews, foreign_key: "user_id"
  # def services
  #   Service.where(id: pro_service[:service_ids])
  # end

  def open_projects
    Project.where(status: :open, service_id: services)
  end

end
