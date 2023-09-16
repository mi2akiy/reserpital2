require 'test_helper'

class Admin::HospitalsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_hospitals_index_url
    assert_response :success
  end

  test 'should get new' do
    get admin_hospitals_new_url
    assert_response :success
  end

  test 'should get show' do
    get admin_hospitals_show_url
    assert_response :success
  end

  test 'should get edit' do
    get admin_hospitals_edit_url
    assert_response :success
  end
end
