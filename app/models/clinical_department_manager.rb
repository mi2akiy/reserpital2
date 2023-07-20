class ClinicalDepartmentManager < ApplicationRecord
  belongs_to :hospital
  belongs_to :clinical_department
end
