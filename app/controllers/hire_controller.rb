class HireController<ApplicationController
  def index
    @industries = Industry.all
  end
end