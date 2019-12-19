require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_index_path
    assert_response :success
  end

  test "should get show" do
    get posts_show_path
    assert_response :success
  end

  test "should get new" do
    get posts_new_path
    assert_response :success
  end

  test "should get edit" do
    get posts_edit_path
    assert_response :success
  end

end
