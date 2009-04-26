class Resource < ActiveRecord::Base
  has_many :resource_allocations
  has_many :projects, :through => :resource_allocations, :uniq => true
  validates_presence_of :first_name, :last_name
  validates_associated :resource_allocations

  # Ex:
  # dave.assign_to(projects(:alpha)).from("01/05/2009").to("01/10/2009")
  def assign_to(project)
    @tmp_project = project
    self
  end
  
  def from(date)
    raise "Must call through assign_to method" unless @tmp_project
    @tmp_from_date = date
    self
  end
  
  def to(date)
    raise "Must call from() assign_to method" unless (@tmp_from_date && @tmp_project)
    days = DateDimension.find(:all, :conditions => "datetime > '#{@tmp_from_date}' and datetime < '#{date}'")
    work_days = days.reject { |d| d.is_weekend? }
    res_allocs = work_days.collect do |day|
      resource_allocations.build({
        :date_dimension => day, 
        :project => @tmp_project
        })
    end
    @tmp_project = nil
    @tmp_from_date = nil
    
    res_allocs
  end
end
