require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "can see home page" do
    get '/'
    assert_response :success
    assert_select 'a', "Sign up here!"
  end
end
