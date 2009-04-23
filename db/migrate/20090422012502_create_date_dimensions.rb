class CreateDateDimensions < ActiveRecord::Migration
  def self.up
    create_table :date_dimensions do |t|
      t.integer :year, :month, :day
      t.string :holiday
      t.timestamps
    end
  end

  def self.down
    drop_table :date_dimensions
  end
end
