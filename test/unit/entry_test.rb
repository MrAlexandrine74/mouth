require File.dirname(__FILE__) + '/../test_helper'

# Using post as STI should be accessed via subclasses
class EntryTest < ActiveSupport::TestCase
    def test_should_have_title
      assert_no_difference 'Post.count' do
        @post = create_post :title => nil
        assert @post.errors.on(:title)
      end
    end

    def test_should_not_create_permalink_if_exists
      @post = Post.find(:first)
      original_permalink = @post.permalink
      @post.title = "Foo Bar"
      assert_not_nil @post.permalink
      @post.save
      assert @post.permalink == original_permalink
    end

    def test_should_make_permalink_if_blank_on_save
      @post = Post.find(:first)
      @post.permalink = nil
      @post.title = "Foo"
      @post.save
      assert @post.permalink == "foo"
    end

    def test_should_make_permalink_if_blank_on_create
      @post = create_post :title => "foo"
      assert_not_nil @post.permalink, "permalink is nil"
      assert @post.permalink == "foo", "permalink is not 'foo', it is '#{@post.permalink}'"
    end

    def test_should_dasherize_slug_if_title_has_spaces
      @post = create_post(:title => "Jee Whiz")
      assert @post.permalink == "jee-whiz"
    end

    def test_should_ignore_special_characters_in_slugs
      @post = create_post(:slug => "foo-bar$%^&test")
      assert @post.permalink == "foo-bar-test", "permalink is '#{@post.permalink}'"
    end

    def test_should_have_unique_permalink
      @post = create_post(:permalink => first_post.permalink)
      @post.save
      assert @post.permalink != first_post.permalink, "permalink is the same as the first posts permalink"
    end
    
    def test_should_have_body_present
      assert_no_difference 'Post.count' do
        @post = create_post :body => nil
        assert @post.errors.on(:body)
      end      
    end
    
    def test_should_update_published_at_when_published
      @post = create_post
      assert_nil @post.published_at
      @post.publish!
      assert_not_nil @post.published_at
    end
    
  private
    def first_post
      @first_post ||= Post.find :first    
    end

    def new_post(options = {})
      first_post
      options[:state] ||= "draft"
      options[:permalink] ||= nil
      options[:published_at] ||= nil
      Post.new(@first_post.attributes.merge!(options))
    end

    def create_post(options = {})
      post = new_post(options)
      post.save
      post
    end
end
