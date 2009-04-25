class DateDimension < ActiveRecord::Base
  has_many :resource_allocations
  has_many :resources, :through => :resource_allocations
  has_many :projects, :through => :resource_allocations
  validates_associated :resource_allocations
  
  def is_weekend?
    day_str =~ /Sat|Sun/
  end
  
end
