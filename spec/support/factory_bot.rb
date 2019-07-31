require_relative 'controller_macros'
require_relative 'login_support'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  #config.extend ControllerMacros, :type => :controller
  config.include LoginSupport
end