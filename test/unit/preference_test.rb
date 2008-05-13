require File.dirname(__FILE__) + '/../test_helper'

class PreferenceTest < ActiveSupport::TestCase
  def test_can_set_and_get_preference
    assert_nil      Preference.get('foo')    
    assert          Preference.set('foo', 'bar')
    assert_not_nil  Preference.get('foo')
    assert          Preference.get('foo') == "bar"
  end
  
  def test_can_set_already_set_preference
    # flunk
  end
  
  def test_can_set_default_preference
    assert_nil      Preference.get('foo')
    assert          Preference.set_unless_exists('foo', 'bar')
    assert_not_nil  Preference.get('foo')
    assert          Preference.get('foo') == "bar"
    foo =           Preference.get('foo')
    assert          Preference.set_unless_exists('foo', 'baz')
    assert          Preference.get('foo') == "bar"
  end
end
