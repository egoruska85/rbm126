require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get work:references" do
    get comments_work:references_url
    assert_response :success
  end

  test "should get author:string" do
    get comments_author:string_url
    assert_response :success
  end

  test "should get message:body" do
    get comments_message:body_url
    assert_response :success
  end
end
