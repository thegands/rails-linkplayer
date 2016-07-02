class PlaylistPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  # def show?
  #   scope.where(:id => record.id).exists?
  # end

  def create?
    !!user
  end

  def new?
    create?
  end

  def update?
    user.try(:admin?) || record.try(:user) == user
  end

  def edit?
    update?
  end

  def destroy?
    user.try(:admin?)
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
