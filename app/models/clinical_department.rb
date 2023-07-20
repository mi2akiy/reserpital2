class ClinicalDepartment < ApplicationRecord
    has_many :clinical_department_managers, dependent: :destroy
     
    has_many :hospitals, through: :clinical_department_managers
end
