class PaymentsController < ApplicationController
  def create
    pay_request = PaypalAdaptive::Request.new

    data = {
      "returnUrl" => payment_completed_url,
      "requestEnvelope" => {"errorLanguage" => "en_US"},
      "currencyCode"=>"USD",
      "receiverList"=>{"receiver"=>[
        {
          "email"=>"erjica_1350132445_per@gmail.com",
          "amount"=>"10.00",
          "paymentType" => "PERSONAL"
        }
      ]},
      "cancelUrl"=> payment_canceled_url,
      "actionType"=>"PAY",
      "feesPayer" => "SENDER",
      "ipnNotificationUrl"=>ipn_notification_url,
      "ClientDetails" => {
        applicationId: "splitpay.at",
        ipAddress: request.ip
      }
    }

    pay_response = pay_request.pay(data)

    # debugger
    if pay_response.success?
      redirect_to pay_response.approve_paypal_payment_url
    else
      puts pay_response.errors.first['message']
      redirect_to failed_payment_url
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
