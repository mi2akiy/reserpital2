require 'test_helper'

class Public::HospitalsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get public_hospitals_index_url
    assert_response :success
  end

  test 'should get show' do
    get public_hospitals_show_url
    assert_response :success
  end
end
