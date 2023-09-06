require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should set default role" do
    user = User.new(email: 'test@example.com', password: 'password')
    user.save
    assert_not user.admin?
  end
  
  test "should be able to set admin role" do
    user = users(:admin)
    assert user.admin?
  end

  test "should attach photo to user" do
    user = users(:one)
    user.photo.attach(io: File.open(Rails.root.join('test', 'fixtures', 'files', 'my_image.jpg')), filename: 'my_image.jpg', content_type: 'image/jpg')
    assert user.photo.attached?
  end
end
