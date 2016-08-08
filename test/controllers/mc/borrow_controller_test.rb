require 'test_helper'

class Mc::BorrowControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

end
