require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "can see home page" do
    get '/'
    assert_response :success
    assert_select 'a', "Sign up here!"
  end

  # test "when logged in can see the user dashboard" do
  #   user = build(:user)
  #   get login_url
  #   post sessions_url, params: { email: user.email, password: user.password }
  #   get user_url
  #   assert_response :success
  #   assert_select 'span', "Welcome, #{user.first_name}"
  # end
end
