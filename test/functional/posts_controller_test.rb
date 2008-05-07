require File.dirname(__FILE__) + '/../test_helper'

class PostsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
    assigns(:posts).each do |post|
      assert post.status_is_published?
    end
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_post
    assert_difference('Post.count') do
      post :create, :post => { }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  def test_should_show_post
    get :show, :id => posts(:published).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => posts(:published).id
    assert_response :success
  end

  def test_should_update_post
    put :update, :id => posts(:published).id, :post => { }
    assert_redirected_to post_path(assigns(:post))
  end

  def test_should_destroy_post
    assert_difference('Post.count', -1) do
      delete :destroy, :id => posts(:published).id
    end

    assert_redirected_to posts_path
  end
end
