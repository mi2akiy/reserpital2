class Reservation < ApplicationRecord
  belongs_to :end_user
  belongs_to :hospital

  enum status: {accepted: 0, call: 1, cancel: 2, examined: 3}

  validate :end_user_has_no_pending_appointments, unless: -> { validation_context == :skip_end_user_has_no_pending_appointments }

  def end_user_has_no_pending_appointments
    if end_user.reservations.where.not(status: 'examined').exists? && status != 'cancel'
      errors.add(:base, "前回の予約がまだ診察済になっていません。")
    end
  end

end
