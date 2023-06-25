require "test_helper"

class Owner::ReservesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get owner_reserves_edit_url
    assert_response :success
  end
end
