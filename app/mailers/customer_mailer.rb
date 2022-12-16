class CustomerMailer < ApplicationMailer
  default from: 'janvi.s@applocum.org'

  def welcome_email
    @customer = params[:customer]
    @url  = 'http://localhost:3000/customers/sign_up'
    mail(to: @customer.email, subject: 'Welcome to Shopping_cart')
  end
end
