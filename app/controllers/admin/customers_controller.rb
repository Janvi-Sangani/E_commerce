module Admin
  class CustomersController < ApplicationController
    def index
      @customers = Customer.all
    end
  end
end