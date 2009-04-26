require File.dirname(__FILE__) + '/../test_helper'
require 'pp'
class DateDimensionTest < ActiveSupport::TestCase
  test "the count" do
    assert_equal(90,DateDimension.count)
  end
  
  test "the day of the week" do
    day = date_dimensions(:f1)
    assert_equal("Thursday", day.day_str)
  end
  
  test "is a weekend day?" do
    day = date_dimensions(:f3)
    assert_equal("Saturday", day.day_str)
    assert(day.is_weekend?)
    
    day = date_dimensions(:f2)
    assert_equal("Friday", day.day_str)
    assert(!day.is_weekend?)
  end
  
  test "has many resource allocations" do
    day = date_dimensions(:f1)
    assert_difference "ResourceAllocation.count", 1 do
      day.resource_allocations.build({
        :resource => resources(:bob),
        :project => projects(:alpha)
      })
      day.save
    end
  end
  
  test "has many resources through resource allocations" do
    day = date_dimensions(:f1)
    assert_difference "day.resources.size", 1 do
      day.resource_allocations.build({
        :resource => resources(:bob),
        :project => projects(:alpha)
      })
      day.save
    end
  end
  
  test "can't create resource allocation that isn't valid" do
    day = date_dimensions(:f1)
    assert_difference "ResourceAllocation.count", 0 do
      day.resource_allocations.build({
        :resource => resources(:bob)
      })
      day.save
    end
  end
end

