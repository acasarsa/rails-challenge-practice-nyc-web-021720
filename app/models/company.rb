class Company < ApplicationRecord
  has_many :offices
  has_many :buildings, through: :offices
  has_many :employees

  def total_rent
    array = []

    self.offices.each do |office| 
      array << office.building.rent_per_floor 
    end
    array.sum 
  end

  
end

