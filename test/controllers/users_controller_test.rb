require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "can see home page" do
    get '/'
    assert response.status == 200
  end
end
