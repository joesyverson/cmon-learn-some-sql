class Client < ApplicationRecord
  has_many :sales
  has_many :employees, through: :sales
end
