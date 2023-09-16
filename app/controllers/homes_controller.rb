class HomesController < ApplicationController
  def top
    return unless owner_signed_in?

    @hospital = current_owner.hospital
  end
end
