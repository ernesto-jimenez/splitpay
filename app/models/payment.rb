class Payment < ActiveRecord::Base
  attr_accessible :email, :name
  belongs_to :campaign
  belongs_to :user

  scope :completed, where(:status => "COMPLETED")

  validates_presence_of :campaign
  validates_presence_of :key
  validates_presence_of :tracking_id

  Statuses = %w{CREATED COMPLETED INCOMPLETE ERROR REVERSALERROR
                PROCESSING PENDING}

  delegate :currency, :amount, :user_email,
    :to => :campaign, :prefix => true

  delegate :email, :name, :to => :user, :prefix => true

  attr_accessor :payment_url, :payment_error

  def tracking_id
    self[:tracking_id] ||= "#{Time.now.to_f}-#{rand(10**20)}"
  end

  before_save :set_user
  def set_user
    if email && !user_id
      self.user = User.find_or_create_by_email(email)
    end
  end

  def user_with_lazy_load
    if user = user_without_lazy_load
      user
    else
      set_user
    end
  end
  alias_method_chain :user, :lazy_load

  def update_status
    request = PaypalAdaptive::Request.new

    response = request.payment_details({
      requestEnvelope: { errorLanguage: "en_US" },
      payKey: key
    })


    if response['responseEnvelope']['ack'] == 'Success'
      self.status = response['status']
      self.email = response['senderEmail']
      self.raw_details = response.to_json
      self.save
    else
      logger.error(response)
      raise "Fcuk!"
    end
  end

  def pay(data)
    request = PaypalAdaptive::Request.new

    data = data.merge({
      trackingId: tracking_id,
      currencyCode: campaign_currency,
      receiverList: {
        receiver: [
          {
            email: campaign_user_email,
            amount: campaign_amount,
            paymentType: "PERSONAL"
          }
        ]
      },
      actionType: "PAY",
      feesPayer: "SENDER",
      requestEnvelope: { errorLanguage: "en_US" }
    })

    response = request.pay(data)

    if response.success?
      self.key = response['payKey']
      self.status = "CREATED"
      self.raw_details = data.to_json
      if self.save
        self.payment_url = response.approve_paypal_payment_url
      end
    else
      self.payment_error = response.errors.first['message']
    end

    return !!payment_url
  end

  def user_info
    {email: email}
  end

  def details
    JSON.parse(raw_details)
  end
end
