class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def initialize(user)
      @user = user
    end

    def index?
      @user.has_any_role? :admin, :seller
    end

    private

    attr_reader :user, :scope
  end
end
