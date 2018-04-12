class DowngradesController < ApplicationController

  def update
    current_user.update! role: 0
    redirect_to wikis_path
    flash[:notice] = "You have been downgraded to a free account, all private wikis are now public."
  end

end
