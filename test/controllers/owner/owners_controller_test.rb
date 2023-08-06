require "test_helper"

class Owner::OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owner_owners_index_url
    assert_response :success
  end
end
