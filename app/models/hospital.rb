class Hospital < ApplicationRecord
  has_one_attached :hospital_image
  has_many :owners
  has_many :reservations, dependent: :destroy
  has_many :clinical_department_managers, dependent: :destroy
  has_many :clinical_departments, through: :clinical_department_managers

  validates :name, presence: true
  validates :telephone_number, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  def get_hospital_image(width, height)
    unless hospital_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      hospital_image.attach(io: File.open(file_path), filename: 'noimage.jpg', content_type: 'image/jpeg')
    end
    hospital_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[address am_end_time am_start_time created_at friday_am friday_pm holiday_am holiday_pm
       home_page id monday_am monday_pm name pm_end_time pm_start_time postal_code saturday_am saturday_pm sunday_am sunday_pm telephone_number thursday_am thursday_pm tuesday_am tuesday_pm updated_at wednesday_am wednesday_pm]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[owners reservations clinical_department_managers clinical_departments]
  end
end
