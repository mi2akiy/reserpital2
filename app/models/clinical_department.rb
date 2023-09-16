class ClinicalDepartment < ApplicationRecord
  has_many :clinical_department_managers, dependent: :destroy
  has_many :hospitals, through: :clinical_department_managers

  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end
end
