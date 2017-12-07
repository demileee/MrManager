require 'test_helper'


class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get login_url
    assert_response :success
    assert_select 'h1', "Login"
  end

  test "should get create" do
    user = build(:user)
    post sessions_url, params: { email: user.email, password: user.password }
    assert_response :success
  end

  test "wrong login" do
    post sessions_url, params: { email: "test@email.com", password: "password" }
    assert_response :success
    assert_select 'h1', "Login"

  end

  test "should get destroy" do
    user = build(:user)
    user.save
    get login_url
    post sessions_url, params: { email: user.email, password: user.password }
    delete logout_url
    assert_response :redirect
  end

end
