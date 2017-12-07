require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "can see home page" do
    get '/'
    assert_response :success
    assert_select 'a', "Sign up here!"
  end

  test "redirected to login if not logged in" do
    get user_url
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', "Login"
  end
end
