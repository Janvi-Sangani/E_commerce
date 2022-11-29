module Admin
  class HomesController < ::ApplicationController
    before_action :authenticate_user!
 
    def index
      # binding.irb
      @user = pundit_user
    end
  end
end
