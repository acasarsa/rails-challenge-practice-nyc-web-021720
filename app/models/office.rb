class Office < ApplicationRecord
  belongs_to :building
  # has fk building  building_id
  belongs_to :company
  # has fk company company_id
  has_many :employees, through: :company
  validates :floor, numericality: {only_integer: true}
end