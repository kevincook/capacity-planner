require File.dirname(__FILE__) + '/../test_helper'

class ResourceTest < ActiveSupport::TestCase
  test "can create many resource_allocations" do
    resource = Resource.new(:first_name => "Joe", :last_name => "Bob" )
    assert(resource.save)
    assert_difference "ResourceAllocation.count", 2 do
      ra = resource.resource_allocations.build({
        :date_dimension => date_dimensions(:f1),
        :project        => projects(:alpha)
      })
      resource.save
      ra2 = resource.resource_allocations.build({
        :date_dimension => date_dimensions(:f2),
        :project        => projects(:alpha)
      })
      resource.save
      assert_not_nil(ra.resource_id)
      assert(ra.resource_id == ra2.resource_id)
    end
  end
  
  test "can't allocate resource to same date_dimension twice" do
    resource = resources(:bob)
    assert_difference "ResourceAllocation.count", 1 do
      ra = resource.resource_allocations.build({
        :date_dimension => date_dimensions(:f1),
        :project        => projects(:alpha)
      })
      resource.save
      ra2 = resource.resource_allocations.build({
        :date_dimension => date_dimensions(:f1),
        :project        => projects(:alpha)
      })
      assert(!resource.save)
      ra2 = resource.resource_allocations.build({
        :date_dimension => date_dimensions(:f1),
        :project        => projects(:beta)
      })
      assert_not_nil(ra.resource_id)
      assert(ra.resource_id == ra2.resource_id)
    end
  end
  
  test "can't leave first or last name blank" do
    assert_equal(false, Resource.new.save)
    assert_equal(false, Resource.new(:first_name => "value").save)
    assert_equal(false, Resource.new(:last_name => "value").save)
  end
  
  test "can have many projects through resource_allocation" do
    resource = resources(:bob)
    assert_difference "ResourceAllocation.count", 1 do
      resource.resource_allocations.build({
        :date_dimension => date_dimensions(:f1),
        :project        => projects(:beta)
      })
      assert_difference "resource.projects.size", 1 do
        resource.save
      end
    end
  end
  
  test "can't call from or to directly" do
    dave = resources(:dave)
    assert_raise(RuntimeError) { dave.from("2009-01-05") }
    assert_raise(RuntimeError) { dave.to("2009-01-10") }
  end
  
  test "can assign resource to project via date range without weekends" do
    dave = resources(:dave)
    assert_difference "ResourceAllocation.count", 4 do
      res_allocs = dave.assign_to(projects(:alpha)).from("2009-01-05").to("2009-01-10")
      assert_equal(4, res_allocs.size)
      dave.save
    end
    
    
  end
end
