class Project < ActiveRecord::Base
  has_many :resource_allocations
  has_many :resources, :through => :resource_allocations, :uniq => true
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_associated :resource_allocations
  
end
