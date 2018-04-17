class CollaboratorsController < ApplicationController

  def create
      @wiki = Wiki.find(params[:wiki_id])
      @user = User.find_by_email(params[:collaborator][:user])

      if User.exists?(@user)
        @collaborator = @wiki.collaborators.new(wiki_id: @wiki.id, user_id: @user.id)

        if @collaborator.save
          flash[:notice] = "User added"
        else
          flash[:error] = "Error"
        end
        redirect_to @wiki
      else
        flash[:error] = "Error, no such user"
        redirect_to @wiki
      end
    end

    def destroy
      @wiki = Wiki.find(params[:wiki_id])
      @collaborator = Collaborator.find(params[:id])

      if @collaborator.destroy
        flash[:notice] = "Delete successfull"
        redirect_to @wiki
      else
        flash.now[:alert] = "There was an error"
        redirect_to @wiki
      end
    end

end
