class WelcomeController < ApplicationController
  def home
    @banners = Banner.in_main
  end
end
