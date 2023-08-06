require "test_helper"

class Owner::HospitalsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get owner_hospitals_show_url
    assert_response :success
  end

  test "should get edit" do
    get owner_hospitals_edit_url
    assert_response :success
  end
end
