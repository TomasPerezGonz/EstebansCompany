require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include ActiveStorage::TestHelper  
  test "should redirect to login if not authenticated" do
    get users_path
    assert_redirected_to new_user_session_path
  end

  test "should get index if authenticated as admin" do
    sign_in users(:admin)
    get users_path
    assert_response :success
  end

  test "should create new user if authenticated as admin" do
    sign_in users(:admin)
    post users_path, params: { user: { email: 'newuser@example.com', password: 'password' } }
    assert_redirected_to users_path
  end

  test "should attach photo to user" do
    sign_in users(:admin) 
    user = users(:one)  
    user.photo.attach(io: File.open(Rails.root.join('test', 'fixtures', 'files', 'my_image.jpg')), filename: 'my_image.jpg', content_type: 'image/jpg')

    assert user.photo.attached?
  end
end


