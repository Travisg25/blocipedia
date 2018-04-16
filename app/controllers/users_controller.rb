class UsersController < ApplicationController

  def downgrade
      @user = current_user
      wikis = user.posts.where(private: true)

      current_user.update_attribute(:role, 'standard')
      wikis.each do |wiki|
        if wiki.user.id == current_user.id
          wiki.update_attribute(:private, false)
        end
      end
      flash[:notice] = "Your account has been downgraded. You are now a Standard member."
      redirect_to users_show_path
    end
end
