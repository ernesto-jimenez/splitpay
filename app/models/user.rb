class User < ActiveRecord::Base
  attr_accessible :email, :last_login_at, :name

  def self.login(info = {})
    info.symbolize_keys!
    raise ArgumentError unless info[:email]

    user = User.find_or_initialize_by_email(info[:email])
    user.name ||= info[:name] || info[:email].split(/[+@]/).first
    user.save

    return user
  end
end
