require 'digest/md5'

class User < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :email
  validates_presence_of :name

  has_many :campaigns

  def self.login(info = {})
    info.symbolize_keys!
    raise ArgumentError unless info[:email]

    user = User.find_or_initialize_by_email(info[:email])
    user.name ||= info[:name] || info[:email].split(/[+@]/).first
    user.last_login_at = Time.now
    user.save

    return user
  end

  def avatar
    hash = Digest::MD5.hexdigest(email.downcase)
    "http://www.gravatar.com/avatar/#{hash}"
  end
end
