class AnimalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # where(user: user)
    end
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def show?
    true
  end

  def destroy?
    record.user == user
  end

end
