require File.dirname(__FILE__) + '/../test_helper'
require 'pp'
class DateDimensionTest < ActiveSupport::TestCase
  test "the count" do
    assert_equal(1827,DateDimension.count)
  end
  
end

