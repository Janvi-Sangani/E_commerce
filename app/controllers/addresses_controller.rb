class AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses
  end

  def new
    @address = Address.new
  end

  def create
    address_params.present?
    @address = Address.new(address_params)
    # binding.irb
    if @address.save
      # flash.now[:messages] = @address.errors.full_messages
      redirect_to place_orders_path
    else
      # binding.irb
      flash.now[:messages] = @address.errors.full_messages
      render "new"
    end
  end
  
  private
  def address_params
    params.require(:address).permit(:address_line1, :address_line2, :address_line3, :city, :address_type, :pincode, :state, :telephone, :mobile_no, :customer_id)
  end
end