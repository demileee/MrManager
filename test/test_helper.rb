require 'simplecov'
SimpleCov.start
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods

  # def sign_in_as(name)
  #   post login_url, params: { sig: users(name).perishable_signature }
  # end

end
