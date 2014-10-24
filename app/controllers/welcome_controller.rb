class WelcomeController < ApplicationController

  def sizes; end

  def home
    @banners = Banner.in_main
    @dresses = Dress.all
  end

  def contacts
    @banners = Banner.in_contacts
  end

end
