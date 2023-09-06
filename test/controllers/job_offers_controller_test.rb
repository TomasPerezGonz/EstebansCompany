require 'test_helper'

class JobOffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_offer = job_offers(:first_offer)
    sign_in users(:one)
  end

  test "should get index" do
    get job_offers_url
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
    assert_equal JobOffer.count, 2
  end

  test "should get show" do
    get job_offer_url(@job_offer)
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
  end

  test "should get new" do
    get new_job_offer_url
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
  end

  test "should get edit" do
    get edit_job_offer_url(@job_offer)
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
  end

  test "should create a job offer" do
    assert_difference "JobOffer.count", 1 do
      post job_offers_url, params: {
        job_offer: {
          title: "Another Job Offer",
          description: "Another Job Offer Description",
          requirements: "Some requirements",
          salary: 70000
        }
      }
    end
    assert_redirected_to job_offer_url(JobOffer.last)
    assert_response :found
    assert_equal 302, response.status
  end

  test "should update a job offer" do
    patch job_offer_url(@job_offer), params: {
      job_offer: {
        title: "Updated Job Offer",
        description: "Updated Job Offer Description"
      }
    }
    @job_offer.reload
    assert_redirected_to job_offer_url(@job_offer)
    assert_response :found
    assert_equal "Updated Job Offer", @job_offer.title
    assert_equal "Updated Job Offer Description", @job_offer.description
    assert_equal 302, response.status
  end

  test "should destroy a job offer" do
    assert_difference "JobOffer.count", -1 do
      delete job_offer_url(@job_offer)
    end
    assert_redirected_to job_offers_url
    assert_response :found
    assert_equal 302, response.status
  end
end


