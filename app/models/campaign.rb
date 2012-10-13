class Campaign < ActiveRecord::Base
  attr_accessible :message, :title, :currency, :amount
  belongs_to :user
  has_many :payments

  validates_presence_of :user
  validates_presence_of :title
  validates_presence_of :amount
  validates_presence_of :currency
  validates_inclusion_of :currency, :in => Currencies.keys

  delegate :name, :avatar, :email, :to => :user, :prefix => true
end
