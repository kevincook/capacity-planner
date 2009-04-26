class CreateDateDim < ActiveRecord::Migration
  def self.up
    start_day = DateTime.parse("01/01/2009")
    (start_day..start_day.years_since(5)).to_a.each do |day|
      DateDimension.create({
        :year =>  day.year, 
        :month => day.month, 
        :day => day.day,
        :day_str => day.strftime("%A"),
        :month_str => day.strftime("%B"),
        :datetime => day
        })
    end
  end

  def self.down
    DateDim.delete_all
  end
end
