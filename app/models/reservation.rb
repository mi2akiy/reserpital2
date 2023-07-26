class Reservation < ApplicationRecord
  belongs_to :end_user
  belongs_to :hospital
  
  enum status: {accepted: 0, call: 1, cancel: 2, examined: 3}
end
