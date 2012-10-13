class PagesController < ApplicationController
  skip_before_filter :require_login

  def home
  end

  def about
  end
end
