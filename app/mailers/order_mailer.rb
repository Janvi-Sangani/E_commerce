class OrderMailer < ApplicationMailer
  default from: 'janvi.s@applocum.org'

  def order_placed
    @order = params[:order]
    @url  = 'http://localhost:3000/orders'
    mail(to: @order, subject: 'Order Placed')
  end

  def order_delivered
    @order = params[:order]
    customer_name = Customer.find_by(email: @order).name
    @url  = 'http://localhost:3000/orders/my'
    mail(to: @order, subject: 'Order delivered')
  end
end
