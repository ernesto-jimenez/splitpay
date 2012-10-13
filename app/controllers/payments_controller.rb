class PaymentsController < ApplicationController
  def create
    payment = Campaign.first.payments.build

    can_pay = payment.pay({
      returnUrl: payment_completed_url(track: payment.tracking_id),
      cancelUrl: payment_canceled_url(track: payment.tracking_id),
      ipnNotificationUrl: ipn_notification_url,
      ClientDetails: {
        applicationId: "splitpay.at",
        ipAddress: request.ip
      }
    })

    # debugger
    if can_pay
      redirect_to payment.payment_url
    else
      puts payment.payment_error
      redirect_to payment_canceled_url
    end
  end

  def completed
    debugger
    render :text => 'payment completed'
  end

  def canceled
    render :text => 'payment cancelled'
  end
end
