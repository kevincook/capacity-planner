class ResourceAllocation < ActiveRecord::Base
  belongs_to :resource
  belongs_to :date_dimension
  
end
