class TagPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin == true
  end

  def new?
    user.admin == true
  end

  def show?
    return true
  end

  def edit?
    user.admin == true
  end

  def update?
    user.admin == true
  end

  def index
    return true
  end

  def destroy?
    user.admin == true
  end
end
