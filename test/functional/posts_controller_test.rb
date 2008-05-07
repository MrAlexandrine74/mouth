require File.dirname(__FILE__) + '/../test_helper'

class PostsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
    assigns(:posts).each do |post|
      assert post.published?
    end
  end

  def test_should_show_post
    get :show, :id => posts(:published).id
    assert_response :success
  end
end
