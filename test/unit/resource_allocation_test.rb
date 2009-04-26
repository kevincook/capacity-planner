require 'test_helper'

class ResourceAllocationTest < ActiveSupport::TestCase
  test "should belong to resource, project, date_dimension" do
    assert_difference "ResourceAllocation.count", 1 do
      ra = ResourceAllocation.new(
        :project => projects(:alpha), 
        :resource => resources(:bob),
        :date_dimension => date_dimensions(:f1))
      ra.save
      assert_not_nil(ra.project_id)
      assert_not_nil(ra.resource_id)
      assert_not_nil(ra.date_dimension_id)
    end
  end
  
  test "can't create without resource, project and date_dimension" do
    assert_no_difference "ResourceAllocation.count" do
      ResourceAllocation.new.save
      ResourceAllocation.new(:date_dimension => date_dimensions(:f1)).save
      ResourceAllocation.new(:project => projects(:alpha)).save
      ResourceAllocation.new(:resource => resources(:bob)).save
      ResourceAllocation.new do |r|
        r.project  = projects(:alpha)
        r.resource = resources(:bob)
      end.save
    end
    
  end
  
end
