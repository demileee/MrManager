require 'test_helper'


class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get login_url
    assert_response :success
    assert_select 'h1', "Login"
  end

  test "should get create" do
    user = build(:user)
    get login_url
    post sessions_url, params: { email: user.email, password: user.password }
    assert_response :success
  end
  #
  # test "should get destroy" do
  #   get logout_url
  #   assert_response :success
  # end

end
