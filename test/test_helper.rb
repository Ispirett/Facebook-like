ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest'

MiniTest::Reporters.use!
class ActiveSupport::TestCase


  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # config.include Devise::ControllerHelpers, :type => :contoller
  # config.include Warden::Test::Helpers
  #include Warden::Helpers

  # def sign_in(user)
  #   if integration_test?
  #     login_as(user, :scope => :user)
  #   else
  #     sign_in(user)
  #   end
  # end

end
