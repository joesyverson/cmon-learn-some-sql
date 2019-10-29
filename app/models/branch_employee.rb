class BranchEmployee < ApplicationRecord
  belongs_to :employee
  belongs_to :branch
end
