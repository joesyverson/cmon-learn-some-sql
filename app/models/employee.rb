class Employee < ApplicationRecord
  has_one :branch_employee
  has_one :branch, through: :branch_employee

  has_many :sales
  has_many :clientes, through: :sales

  has_one :inferior_superior, foreign_key: :inferior_id, class_name: "SuperiorInferior"
  has_one :superior, through: :inferior_superior

  has_many :superior_inferiors, foreign_key: :superior_id, class_name: "SuperiorInferior"
  has_many :inferiors, through: :superior_inferiors
end
