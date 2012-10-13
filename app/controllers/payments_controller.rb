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
    payment = Payment.find_by_tracking_id(params[:track])
    if payment
      payment.update_status
      redirect_to "/campaign/1"
    else
      redirect_to root_path
    end
  end

  def canceled
    render :text => 'payment cancelled'
  end
end
