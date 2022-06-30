class BelieverPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    !user.unauthorized?
  end

  def show?
    !user.unauthorized?
  end

  def create?
    !user.unauthorized?
  end

  def update?
    !user.unauthorized?
  end

  def destroy?
    user.monk? || user.master?
  end

end
