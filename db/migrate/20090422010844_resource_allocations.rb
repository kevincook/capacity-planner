class ResourceAllocations < ActiveRecord::Migration
  def self.up
    create_table :resource_allocations do |t|
      t.integer :resource_id, :date_dimension_id
      t.timestamps
    end
  end

  def self.down
    drop_table :time_slots
  end
end
