class WelcomeController < ApplicationController

  def sizes; end

  def home
    @banners = Banner.in_main
  end

  def contacts
    @banners = Banner.in_contacts
  end

end
