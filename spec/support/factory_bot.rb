
require 'capybara/rails'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  #config.include RequestSpecHelper, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Capybara::DSL
end