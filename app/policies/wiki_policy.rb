class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

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
