require File.dirname(__FILE__) + '/../test_helper'

class PreferenceTest < ActiveSupport::TestCase
  def test_can_set_and_get_preference
    assert_nil  Preference.get('foo')    
    assert      Preference.set('foo', 'bar')
    assert      Preference.get('foo')
  end
end
