class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if @user.has_role? :admin
        scope.all
      else
        scope.where(user_id: @user.id)
      end
    end

    def index?
      true
    end
  end
end
