require 'test_helper'

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should redirect to login if not authenticated" do
    get job_applications_path
    assert_redirected_to new_user_session_path
  end

  test "should get index if authenticated" do
    sign_in users(:one)
    get job_applications_path
    assert_response :success
  end

  test "should create job application" do
    sign_in users(:one)
    post job_applications_path, params: { job_offer_id: job_offers(:one).id }
    assert_redirected_to job_offers_path
  end

  test "admin should not create job application" do
    sign_in users(:admin) 
    post job_applications_path, params: { job_offer_id: job_offers(:one).id }
    if users(:admin).admin?
      assert_redirected_to root_path 
    end
  end
end



