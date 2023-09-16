require 'test_helper'

class Admin::ClinicalDepartmentManagersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_clinical_department_managers_index_url
    assert_response :success
  end
end
