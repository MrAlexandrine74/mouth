require 'test_helper'
class Admin::PostsControllerTest < ActionController::TestCase
  def test_should_get_index
    be_logged_in_and_admin
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  def test_should_get_new
    be_logged_in_and_admin
    get :new
    assert_response :success
  end

  def test_should_create_post
    be_logged_in_and_admin
    assert_difference('Post.count') do
      post :create, :post => { }
    end

    assert_redirected_to admin_post_path(assigns(:post))
  end

  def test_should_show_post
    be_logged_in_and_admin
    get :show, :id => posts(:published).id
    assert_response :success
  end
  
  def test_should_get_edit
    be_logged_in_and_admin
    get :edit, :id => posts(:published).id
    assert_response :success
  end
  
  def test_should_update_post
    be_logged_in_and_admin
    put :update, :id => posts(:published).id, :post => { }
    assert_redirected_to admin_post_path(assigns(:post))
  end
  
  def test_should_destroy_post
    be_logged_in_and_admin
    assert_difference('Post.count', -1) do
      delete :destroy, :id => posts(:published).id
    end
  
    assert_redirected_to admin_posts_path
  end
end
