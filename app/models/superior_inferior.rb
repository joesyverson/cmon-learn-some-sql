class SuperiorInferior < ApplicationRecord
  belongs_to :superior, class_name: "Employee"
  belongs_to :inferior, class_name: "Employee"
end
