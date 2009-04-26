class ResourceAllocations < ActiveRecord::Migration
  def self.up
    create_table :resource_allocations do |t|
      t.integer :resource_id, :date_dimension_id, :project_id
      t.timestamps
    end
    
    # Not sure if we will need these at all...
    # add_index :resource_allocations, [:resource_id, :date_dimension_id, :project_id]
    # add_index :resource_allocations, [:resource_id, :project_id]
    # add_index :resource_allocations, [:resource_id, :date_dimension_id]
    add_index :resource_allocations, [:resource_id]
    add_index :resource_allocations, [:date_dimension_id]
    add_index :resource_allocations, [:project_id]
  end

  def self.down
    drop_table :time_slots
  end
end
