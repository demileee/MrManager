require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "can see home page" do
    get root_url
    assert_response :success
    assert_select 'a', "Sign up here!"
  end

  test "user create page" do
    get new_user_url
    assert_response :success
    assert_select 'h1', "Sign up?"
  end

  test "redirected to login if not logged in" do
    get user_url
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', "Login"
  end

  test "redirect to user dashboard" do
    user = build(:user)
    user.save
    post sessions_url, params: { email: user.email, password: user.password }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'div', "Welcome, #{user.first_name.capitalize}"
  end

  test "redirect to user dashboard after login" do
    user = build(:user)
    user.save
    post sessions_url, params: { email: user.email, password: user.password }
    get root_url
    assert_response :redirect
  end

end
