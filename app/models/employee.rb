class Employee < ApplicationRecord
  belongs_to :company
  # has fk of company company_id
  has_one :office, through: :company
  validates :name, length: { minimum: 6 }
end



