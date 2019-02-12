require 'test_helper'

class SurveyControllerTest < ActionDispatch::IntegrationTest
  test "should get subject:integer" do
    get survey_subject:integer_url
    assert_response :success
  end

end
