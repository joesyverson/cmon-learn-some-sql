class Branch < ApplicationRecord
  has_many :branch_employees
  has_many :employees, through: :branch_employees
end
