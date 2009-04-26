class ResourceAllocation < ActiveRecord::Base
  belongs_to :resource
  belongs_to :date_dimension
  belongs_to :project
  validates_presence_of :resource, :date_dimension, :project
  validates_uniqueness_of :resource_id, :scope => :date_dimension_id
end
