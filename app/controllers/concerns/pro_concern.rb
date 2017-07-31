module ProConcern
  extend ActiveSupport::Concern

  def set_services(services, user, radius)
      services.each do |id|
        user.pro_services.create(service_id: id, radius: radius)
      end    
  end
end