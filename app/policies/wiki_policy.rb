class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  class Scope
       attr_reader :user, :scope

       def initialize(user, scope)
         @user = user
         @scope = scope
       end

       def resolve
         wikis = []
         if user.role == 'admin'
           wikis = scope.all # if the user is an admin, show them all the wikis
         elsif user.role == 'premium'
           all_wikis = scope.all
           all_wikis.each do |wiki|
             if wiki.public? || wiki.owner == user || wiki.collaborators.include?(user)
               wikis << wiki 
             end
           end
         else # this is the lowly standard user
           all_wikis = scope.all
           wikis = []
           all_wikis.each do |wiki|
             if wiki.public? || wiki.collaborators.include?(user)
               wikis << wiki
             end
           end
         end
         wikis
       end
     end
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show?
    wiki.private? && user.premium? or user.admin? || @wiki.private == false
  end

  def create?
    user.present?
  end

  def edit?
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.admin? || @user.id == @wiki.user_id
  end
end
