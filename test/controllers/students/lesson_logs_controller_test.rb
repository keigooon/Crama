require 'test_helper'

class Students::LessonLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get students_lesson_logs_index_url
    assert_response :success
  end

end
