class Pro < User
  has_one :pro_service, foreign_key: :user_id, dependent: :destroy
  has_many :bids

  scope :open, -> {where(status: 'open')}
  scope :accepted, -> {where(status: 'accepted')}
  scope :closed, -> {where(status: 'closed')}
  
  def services
    Service.where(id: pro_service[:service_ids])
  end

  def open_projects
    Project.where(status: :open, service_id: services)
  end

end
