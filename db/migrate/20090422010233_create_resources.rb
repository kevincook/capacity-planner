class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :first_name, :last_name
      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
