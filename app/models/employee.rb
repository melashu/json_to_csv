class Employee < ApplicationRecord 
  validates :fname, :lname, :salary, :company, :position, presence: true
end
