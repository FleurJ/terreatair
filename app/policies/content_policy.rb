class ContentPolicy < ApplicationPolicy
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
end
