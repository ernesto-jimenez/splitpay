# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
use Rack::ForceDomain, 'simplepay.at' if Rails.env.production?
run Splitpayat::Application
