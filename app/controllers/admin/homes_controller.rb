module Admin
  class HomesController < ::ApplicationController
    before_action :authenticate_user!
 
    def index
      @user = pundit_user
    end
  end
end
