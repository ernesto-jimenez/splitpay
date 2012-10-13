class PaymentsController < ApplicationController
  def new
    campaign = Campaign.find_by_random_id(params[:campaign_id])
    payment = campaign.payments.build

    can_pay = payment.pay({
      returnUrl: completed_campaign_payment_url(campaign, payment),
      cancelUrl: canceled_campaign_payment_url(campaign, payment),
      ipnNotificationUrl: ipn_campaign_payment_url(campaign, payment),
      ClientDetails: {
        applicationId: "splitpay.at",
        ipAddress: request.ip
      }
    })

    if can_pay
      redirect_to payment.payment_url
    else
      puts payment.payment_error
      redirect_to campaign
    end
  end

  def completed
    campaign = Campaign.find_by_random_id(params[:campaign_id])
    payment = Payment.find_by_tracking_id(params[:id])
    if payment
      payment.update_status
      redirect_to campaign
    else
      redirect_to root_path
    end
  end

  def canceled
    payment = Payment.find_by_tracking_id(params[:id])
    payment.update_status

    render :text => 'payment cancelled'
  end
end
