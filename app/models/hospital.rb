class Hospital < ApplicationRecord
  has_one_attached :hospital_image
  has_many :owners
  has_many :clinical_department_managers, dependent: :destroy
  has_many :clinical_departments, through: :clinical_department_managers

  def get_hospital_image(width,height)
   unless hospital_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      hospital_image.attach(io: File.open(file_path), filename: 'noimage.jpg', content_type: 'image/jpeg')
   end
    hospital_image.variant(resize_to_limit: [width,height]).processed
  end

end
