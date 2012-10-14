class Campaign < ActiveRecord::Base
  attr_accessible :message, :title, :currency, :amount
  belongs_to :user
  has_many :payments

  validates_presence_of :user
  validates_presence_of :title
  validates_presence_of :amount
  validates_presence_of :currency
  validates_presence_of :random_id
  validates_inclusion_of :currency, :in => Currencies.keys
  validates_numericality_of :amount, :greater_than => 0

  delegate :name, :avatar, :email, :to => :user, :prefix => true

  scope :examples, where(:example => true)

  before_validation :generate_random_id
  def generate_random_id
    self.random_id = SecureRandom.urlsafe_base64(20)
  end

  def to_param
    if random_id
      random_id
    else
      generate_random_id
      save
      random_id
    end
  end

  def paid
    payments.completed.select('email, status, user_id')
  end

  # TODO: this is a stub
  def closed?
    false
  end

  def from?(user)
    self.user == user
  end
end
