class WelcomeController < ApplicationController
  include Banners
  def home
    set_banners
  end
end
