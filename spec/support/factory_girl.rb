RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  include ActionDispatch::TestProcess
end