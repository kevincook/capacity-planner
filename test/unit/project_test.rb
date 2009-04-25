require File.dirname(__FILE__) + '/../test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "fixture is correct" do
    assert_equal(3, Project.count)
  end
  
  test "can't leave name blank" do
    assert_equal(false, Project.new.save)
  end
  
  test "can't create duplicate project" do
    project = Project.new(:name => "Alpha" )
    assert(!project.save)
  end
  
  test "can create many resource_allocations" do
    project = Project.new(:name => "Gamma" )
    assert(project.save)
    assert_difference "ResourceAllocation.count", 1 do
      ra = project.resource_allocations.build({
        :resource       => resources(:bob),
        :date_dimension => date_dimensions(:f1)
      })
      project.save
      assert_not_nil(ra.project_id)
    end
  end
  
  test "can have many resources through resource_allocations" do
    project = projects(:charlie)
    assert_difference "project.resources.size", 2 do
      project.resource_allocations.build({
        :resource       => resources(:bob),
        :date_dimension => date_dimensions(:f1)
      })
      project.resource_allocations.build({
        :resource       => resources(:dave),
        :date_dimension => date_dimensions(:f1)
      })
      project.resource_allocations.build({
        :resource       => resources(:dave),
        :date_dimension => date_dimensions(:f2)
      })
      project.save
    end
  end
  
  test "correctly aggregates resources through resource_allocations" do
    project = projects(:charlie)
    assert_difference "project.resources.size", 1 do
      project.resource_allocations.build({
        :resource       => resources(:bob),
        :date_dimension => date_dimensions(:f1)
      })
      project.resource_allocations.build({
        :resource       => resources(:bob),
        :date_dimension => date_dimensions(:f2)
      })
      project.save
    end
  end
  
end
