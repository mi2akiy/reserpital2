require 'test_helper'

class Admin::ClinicalDepartmentControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get admin_clinical_department_new_url
    assert_response :success
  end
end
