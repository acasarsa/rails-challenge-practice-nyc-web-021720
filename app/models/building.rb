class Building < ApplicationRecord
  has_many :offices
  
  def number_of_floors_available
    # Will not work until relationships and schema are correctly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def rent_per_building
    taken = self.number_of_floors - self.number_of_floors_available.count
    taken * self.rent_per_floor
  end

  def empty_offices
    number_of_floors_available.each { |f| offices.build(floor: f) }
  end

  def total_employees
    sum = 0
    self.offices.each do |office| 
      sum += office.company.employees.count 
    end
    sum
  end

end