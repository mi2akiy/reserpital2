class HomesController < ApplicationController
  def top
    if owner_signed_in?
      @hospital = current_owner.hospital
    end
  end
end
