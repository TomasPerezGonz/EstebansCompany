require "test_helper"

class JobApplicationTest < ActiveSupport::TestCase
  test "should apply to job offer" do
    job_application = JobApplication.new(user: users(:one), job_offer: job_offers(:one))
    assert job_application.save
  end
  
  test "should not apply to the same job offer twice" do
    job_application1 = JobApplication.create(user: users(:one), job_offer: job_offers(:one))
    job_application2 = JobApplication.new(user: users(:one), job_offer: job_offers(:one))
    assert_not job_application2.valid?
  end

  test "admin should not apply to job offer" do
    admin_user = users(:admin) 
    job_application = JobApplication.new(user: admin_user, job_offer: job_offers(:one))
    assert_not job_application.valid? if admin_user.admin?
  end
end

