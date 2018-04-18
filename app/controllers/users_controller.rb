class UsersController < ApplicationController

  def downgrade
      @user = current_user
      wikis = current_user.wikis.where(private: true)

      current_user.update_attribute(:role, 'standard')
      wikis.each do |wiki|
        if wiki.user.id == current_user.id
          wikis.update_all(public: true)
        end
      end
      flash[:notice] = "Your account has been downgraded. You are now a Standard member."
      redirect_to users_show_path
    end
end
