class ApplicationController < ActionController::Base
#before_action :authenticate_user!
# before_action :set_search
include Pundit::Authorization


  def set_search
    @q = Product.search(params[:q])
  end
end