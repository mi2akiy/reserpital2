class ClinicalDepartment < ApplicationRecord
    has_many :clinical_department_managers, dependent: :destroy

    has_many :hospitals, through: :clinical_department_managers

    def self.ransackable_attributes(auth_object = nil)
       ["created_at", "id", "name", "updated_at"]
    end

end
