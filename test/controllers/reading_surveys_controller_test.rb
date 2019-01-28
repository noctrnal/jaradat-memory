require 'test_helper'

class ReadingSurveysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reading_surveys_new_url
    assert_response :success
  end

  test "should get create" do
    get reading_surveys_create_url
    assert_response :success
  end

end
