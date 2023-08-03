require "test_helper"

class Admin::OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_owners_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_owners_edit_url
    assert_response :success
  end
end
