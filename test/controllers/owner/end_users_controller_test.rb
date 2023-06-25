require "test_helper"

class Owner::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get owner_end_users_show_url
    assert_response :success
  end
end
