class UsersController < ApplicationController

  def downgrade
    @user = current_user
    current_user.update_attribute(:role, 'standard')

    flash[:notice] = "Your account has been downgraded."
    redirect_to users_show_path
  end
end
