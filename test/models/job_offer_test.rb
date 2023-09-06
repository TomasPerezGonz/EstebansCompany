require "test_helper"

class JobOfferTest < ActiveSupport::TestCase
  test "should save valid job offer" do
    job_offer = JobOffer.new(title: 'Software Engineer', description: 'We are looking for...', requirements: '3+ years of experience', salary: 90000)
    assert job_offer.save
  end
  
  test "should not save job offer without title" do
    job_offer = JobOffer.new(description: 'We are looking for...', requirements: '3+ years of experience', salary: 90000)
    assert_not job_offer.save
  end

  test "should update job offer" do
    job_offer = job_offers(:one) 
    job_offer.title = 'Updated Title'
    assert job_offer.save
  end

end
