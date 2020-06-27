require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
  test "should get show" do
    get users_show_url
    assert_response :success
  end

>>>>>>> origin/master
end
